# clean_audit_data.py
import pandas as pd
import re

tsr_excel_path = ("../data/2025 TSR Box Office Audit for SQL.xlsx")

tsrfile = pd.ExcelFile(tsr_excel_path)

df = tsrfile.parse("TSR Audit 2025", header=None)

for i, row in df.iterrows():
    col_0 = str(row[0])
    match = re.search(r"(\d{2}/\d{2}/\d{2})", col_0)
    if match: 
        date_str = match.group(1)
        show_date = pd.to_datetime(date_str, format="%m/%d/%y")
        name_only = col_0.split(match.group(0))[0]
        name_only = re.sub(r"\b(?:Sun|Mon|Tues|Wed|Thurs|Fri|Sat)\.?\b\s*", "", name_only).strip()
        if " - " in name_only:
            name_only= name_only.split(" - ", 1)[0].strip()
        clean_name = re.sub(r"\s*-\s*[A-Z]{2,3}\s*\d*", "", name_only).strip()
        print("SHOW:", clean_name, "DATE:", show_date)

