global _starts
extern os_oss_kernel_main
_starts:
	call os_oss_kernel_main
haltss:
    jmp haltss

