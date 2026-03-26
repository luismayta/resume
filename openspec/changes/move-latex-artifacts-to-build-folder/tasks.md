## 1. Configure XeLaTeX output directory

- [x] 1.1 Create `build/` directory in project root
- [x] 1.2 Update Taskfile.yml to add `-output-directory=build` flag to XeLaTeX commands

## 2. Update gitignore

- [x] 2.1 Add `build/` to `.gitignore` to ignore all build artifacts
- [x] 2.2 Remove old root-level artifact patterns that are now redundant (verify they are covered by build/)

## 3. Verify build process

- [x] 3.1 Run `task resume` and verify PDF is generated in `build/`
- [x] 3.2 Run `task resume:ai-architect` and verify profile PDF is in `build/`
- [x] 3.3 Run `task resume:cloud-architect` and verify profile PDF is in `build/`
- [x] 3.4 Verify no artifacts remain in root directory after build

## 4. Clean up

- [x] 4.1 Remove any existing artifact files from root (run clean build)
- [x] 4.2 Test git status shows clean working tree after build