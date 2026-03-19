import pandas as pd
import os

def run_verification():
    log_lines = []
    log_lines.append("="*60)
    log_lines.append("PHASE 4: CROSS-VERIFICATION AUDIT LOG")
    log_lines.append("Generated on: 2026-03-18")
    log_lines.append("="*60 + "\n")

    # Load data
    audit_db = pd.read_csv("data/raw/audit_database.csv")
    raw_ext = pd.read_csv("data/raw_extracted.csv")
    ref_aud = pd.read_csv("data/references_audited.csv")

    critical_errors = 0
    warnings = 0

    # --- BLOCO 1: INTEGRIDADE MATEMÁTICA ---
    log_lines.append("--- BLOCO 1: INTEGRIDADE MATEMÁTICA ---")
    for idx, row in audit_db.iterrows():
        study = row['authors']
        log_lines.append(f"\n[STU] {study}:")
        
        # V1: Soma da matriz
        try:
            if not pd.isna(row['tp']):
                tp, fp, tn, fn = float(row['tp']), float(row['fp']), float(row['tn']), float(row['fn'])
                n_calc = tp + fp + tn + fn
                n_orig = float(row['n_total'])
                if abs(n_calc - n_orig) < 0.001:
                    log_lines.append(f"  V1 (Matrix Sum): OK (Total={n_orig})")
                else:
                    log_lines.append(f"  V1 (Matrix Sum): ERROR! Calc={n_calc}, Orig={n_orig}")
                    critical_errors += 1
                
                # V2: Recalcular Sens/Spec
                sens_calc = tp / (tp + fn) if (tp + fn) > 0 else 0
                spec_calc = tn / (tn + fp) if (tn + fp) > 0 else 0
                
                # Find in raw_extracted for comparison
                raw_row = raw_ext[raw_ext['study_label'] == study]
                if not raw_row.empty:
                    sens_decl = float(raw_row.iloc[0]['sens_pct']) / 100.0
                    spec_decl = float(raw_row.iloc[0]['spec_pct']) / 100.0
                    
                    diff_sens = abs(sens_calc - sens_decl)
                    diff_spec = abs(spec_calc - spec_decl)
                    
                    if diff_sens <= 0.002:
                        log_lines.append(f"  V2 (Sens): OK (Calc={sens_calc:.3f}, Decl={sens_decl:.3f})")
                    else:
                        log_lines.append(f"  V2 (Sens): WARNING! Diff={diff_sens:.4f}")
                        warnings += 1
                        
                    if diff_spec <= 0.002:
                        log_lines.append(f"  V2 (Spec): OK (Calc={spec_calc:.3f}, Decl={spec_decl:.3f})")
                    else:
                        log_lines.append(f"  V2 (Spec): WARNING! Diff={diff_spec:.4f}")
                        warnings += 1
            else:
                log_lines.append("  V1/V2: Skipping (Accuracy Only study)")
        except Exception as e:
            log_lines.append(f"  V1/V2: EXCEPTION: {str(e)}")
            critical_errors += 1

    # --- BLOCO 2: CONSISTÊNCIA ENTRE ARQUIVOS ---
    log_lines.append("\n--- BLOCO 2: CONSISTÊNCIA ENTRE ARQUIVOS ---")
    
    # V5: Nomes/Anos consistency
    audit_labels = set(audit_db['authors'])
    raw_labels = set(raw_ext['study_label'])
    ref_labels = set(ref_aud['Study_Label'])
    
    missing_raw = audit_labels - raw_labels
    missing_ref = audit_labels - ref_labels
    
    if not missing_raw and not missing_ref:
        log_lines.append("  V5 (Naming): OK (All studies present in all files)")
    else:
        log_lines.append(f"  V5 (Naming): ERROR! Missing label in raw: {missing_raw}, ref: {missing_ref}")
        critical_errors += 1

    # V4: Total N
    total_n = audit_db['n_total'].sum()
    log_lines.append(f"  V4 (Total N): {total_n} (Audited sum of 10 studies)")

    # --- BLOCO 3: ALERTAS METODOLÓGICOS ---
    log_lines.append("\n--- BLOCO 3: ALERTAS METODOLÓGICOS ---")
    for idx, row in audit_db.iterrows():
        study = row['authors']
        try:
            if not pd.isna(row['tp']):
                tp, fp, tn, fn = float(row['tp']), float(row['fp']), float(row['tn']), float(row['fn'])
                n_total = float(row['n_total'])
                
                # V6: Zeros
                if tp == 0 or fp == 0 or tn == 0 or fn == 0:
                    log_lines.append(f"  V6 (Zeros) ALERT: {study} has zero cells. +0.5 correction required.")
                    warnings += 1
                
                # V7: Prevalência
                prev = (tp + fn) / n_total
                if prev < 0.01 or prev > 0.70:
                    log_lines.append(f"  V7 (Prev) ALERT: {study} prevalence is {prev:.1%}. Check population selection.")
                    warnings += 1
                
                # V8: Dominância
                weight = n_total / total_n
                if weight > 0.50:
                    log_lines.append(f"  V8 (Dom) ALERT: {study} contributes {weight:.1%} of total N.")
                    warnings += 1
        except:
            pass

    log_lines.append("\n" + "="*60)
    log_lines.append("RESUMO DA FASE 4")
    log_lines.append(f"Erros Críticos: {critical_errors}")
    log_lines.append(f"Alertas/Avisos: {warnings}")
    log_lines.append("="*60)
    
    if critical_errors == 0:
        log_lines.append("\n✅ DADOS APROVADOS PARA FASE 5")
    else:
        log_lines.append("\n❌ DADOS REPROVADOS. CORRIJA OS ERROS CRÍTICOS.")

    # Write to file
    with open("analysis/audit_log.txt", "w", encoding="utf-8") as f:
        f.write("\n".join(log_lines))
    
    print("\n[+] Verification complete. Log generated at analysis/audit_log.txt")

if __name__ == "__main__":
    run_verification()
