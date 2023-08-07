/* Topologies for threads in {2} */

/***************/
/* nthreads=2 */
/***************/

/*
 Topology: {{{0, 1}, {2, 3}}}
*/

static const int _inst_2[] = {
// [[0],[1]]
0, 1, 0, 1,
// [[0,1]]
1, 1, 0, 0,
};

const int *inst_2 = &_inst_2[0];

static const int _role_2[] = {
// [[0],[1]]
1, 1, 0, 0,
// [[0,1]]
0, 1, 0, 1,
};

const int *role_2 = &_role_2[0];

static const char *_group_2[] = {
"[[0],[1]]",
"[[0,1]]",
};

const char **group_2 = &_group_2[0];


