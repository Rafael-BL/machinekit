#undef TRACEPOINT_PROVIDER
#define TRACEPOINT_PROVIDER machinekit_provider

#if !defined(_MACHINEKIT_TP_H) || defined(TRACEPOINT_HEADER_MULTI_READ)
#define _MACHINEKIT_TP_H

#include <lttng/tracepoint.h>

TRACEPOINT_EVENT(
    machinekit_provider,
    function_timestamp,
    TP_ARGS(
        char*, my_function_name,
	char*, my_function_file
    ),
    TP_FIELDS(
        ctf_string(function_name, my_function_name)
	ctf_string(function_file, my_function_file)
    )
)

TRACEPOINT_EVENT(
    machinekit_provider,
    cycle_counter,
    TP_ARGS(
        char*, my_function_name,
	char*, my_function_file,
        int, my_cycle_count
    ),
    TP_FIELDS(
        ctf_string(function_name, my_function_name)
	ctf_string(function_file, my_function_file)
        ctf_integer(int, cycle_count, my_cycle_count)
    )
)

#endif /* _MACHINEKIT_TP_H */

#undef TRACEPOINT_INCLUDE
#define TRACEPOINT_INCLUDE "./machinekit_tp.h"

#include <lttng/tracepoint-event.h>
