import json, sys

path = sys.argv[1]
data = json.load(open(path))

changes = data.get("resource_changes", [])
add = change = destroy = 0

for rc in changes:
    actions = rc.get("change", {}).get("actions", [])
    if actions == ["create"]:
        add += 1
    elif actions == ["update"]:
        change += 1
    elif actions == ["delete"]:
        destroy += 1
    elif "create" in actions and "delete" in actions:
        # replace
        add += 1
        destroy += 1

print("## Terraform Plan Summary")
print("")
print(f"- ✅ **Add**: `{add}`")
print(f"- ✏️ **Change**: `{change}`")
print(f"- 🗑️ **Destroy**: `{destroy}`")
print("")
print("### Notable changes")
shown = 0
for rc in changes:
    if shown >= 10:
        break
    addr = rc.get("address")
    actions = rc.get("change", {}).get("actions", [])
    if actions and actions != ["no-op"]:
        print(f"- `{addr}` → `{actions}`")
        shown += 1

if shown == 0:
    print("- No resource changes detected.")
print("")
print("> Generated automatically by AI Terraform Guardian workflow.")
``