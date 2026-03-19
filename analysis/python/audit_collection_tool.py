import pandas as pd
import os

def validate_row(row):
    """
    Validates the 2x2 matrix if present. 
    Returns 'YES', 'PENDING' (if data missing), or an error message.
    """
    try:
        # Check if 2x2 data exists
        if pd.isna(row['tp']) or pd.isna(row['fp']) or pd.isna(row['tn']) or pd.isna(row['fn']):
            if row['verified_sum'] == 'Accuracy Only':
                return "Accuracy Only"
            return "PENDING"
        
        tp, fp, tn, fn = int(row['tp']), int(row['fp']), int(row['tn']), int(row['fn'])
        total = int(row['n_total'])
        
        if tp + fp + tn + fn == total:
            return "YES"
        else:
            return f"Mismatch: {tp+fp+tn+fn} vs {total}"
    except (ValueError, TypeError):
        return "ERROR"

def run_audit():
    path = "data/raw/audit_database.csv"
    if not os.path.exists(path):
        print(f"Error: {path} not found.")
        return
    
    df = pd.read_csv(path)
    
    # Validation
    df['verified_sum'] = df.apply(validate_row, axis=1)
    
    # Save back
    df.to_csv(path, index=False)
    
    print("\n" + "="*50)
    print("PHASE 3: SYSTEMATIC AUDIT REPORT")
    print("="*50)
    
    summary = df[['authors', 'year', 'verified_sum', 'n_total']]
    print(summary.to_string(index=False))
    
    n_studies = len(df)
    n_verified = len(df[df['verified_sum'] == 'YES'])
    n_pending = len(df[df['verified_sum'] == 'PENDING'])
    
    print("\n--- Statistics ---")
    print(f"Total Studies: {n_studies}")
    print(f"Verified (2x2): {n_verified}")
    print(f"Pending Audit:  {n_pending}")
    
    # Check for missing metadata
    missing_doi = df[df['doi'].isna()]
    if not missing_doi.empty:
        print(f"\n[!] WARNING: Missing DOI for: {', '.join(missing_doi['authors'].tolist())}")

    print("\n[+] Audit database updated.")
    print("="*50 + "\n")

if __name__ == "__main__":
    run_audit()
