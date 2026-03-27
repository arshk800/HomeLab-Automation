import pwd, grp
import datetime

report_file = f"user_report_{datetime.date.today()}.csv"

with open(report_file, 'w') as f:
    f.write("Username,Groups\n")
    for user in pwd.getpwall():
        groups = [g.gr_name for g in grp.getgrall() if user.pw_name in g.gr_mem]
        f.write(f"{user.pw_name},{'|'.join(groups)}\n")
