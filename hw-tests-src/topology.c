/* Topologies for threads in {1,2,3,4} */

/***************/
/* nthreads=1 */
/***************/

/*
 Topology: {{{0, 1}, {2, 3}}}
*/

static const int _inst_1[] = {
// [[0]]
2, 3, 0, 1,
};

const int *inst_1 = &_inst_1[0];

static const int _role_1[] = {
// [[0]]
0, 0, 0, 0,
};

const int *role_1 = &_role_1[0];

static const char *_group_1[] = {
"[[0]]",
};

const char **group_1 = &_group_1[0];



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



/***************/
/* nthreads=3 */
/***************/

/*
 Topology: {{{0, 1}, {2, 3}}}
*/

static const int _inst_3[] = {
// [[1,2],[0]]
0, -1, 0, 0,
// [[0,2],[1]]
0, -1, 0, 0,
// [[0,1],[2]]
0, 0, 0, -1,
};

const int *inst_3 = &_inst_3[0];

static const int _role_3[] = {
// [[1,2],[0]]
0, -1, 1, 2,
// [[0,2],[1]]
1, -1, 0, 2,
// [[0,1],[2]]
0, 1, 2, -1,
};

const int *role_3 = &_role_3[0];

static const char *_group_3[] = {
"[[1,2],[0]]",
"[[0,2],[1]]",
"[[0,1],[2]]",
};

const char **group_3 = &_group_3[0];



/***************/
/* nthreads=4 */
/***************/

/*
 Topology: {{{0, 1}, {2, 3}}}
*/

static const int _inst_4[] = {
// [[0,3],[1,2]]
0, 0, 0, 0,
// [[0,2],[1,3]]
0, 0, 0, 0,
// [[0,1],[2,3]]
0, 0, 0, 0,
};

const int *inst_4 = &_inst_4[0];

static const int _role_4[] = {
// [[0,3],[1,2]]
1, 2, 0, 3,
// [[0,2],[1,3]]
1, 3, 0, 2,
// [[0,1],[2,3]]
2, 3, 0, 1,
};

const int *role_4 = &_role_4[0];

static const char *_group_4[] = {
"[[0,3],[1,2]]",
"[[0,2],[1,3]]",
"[[0,1],[2,3]]",
};

const char **group_4 = &_group_4[0];


