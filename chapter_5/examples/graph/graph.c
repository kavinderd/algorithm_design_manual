#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include "queue.h"

#define MAXV 1000 /* maximum number of vertices */

typedef struct {
  int y;                /* adjaceny info */
  int weight;           /* edge weight, if any */
  struct edgenode *next; /* next edge in list */
} edgenode;

typedef struct {
  edgenode *edges[MAXV+1]; /* adjacency info */
  int degree[MAXV + 1];    /* outdegree of each vertex */
  int nvertices;           /* number of vertices in graph */
  int nedges;              /* number of edges in graph */
  bool directed;           /* is the graph directed? */
} graph;

void initialize_graph(graph *g, bool directed);
void insert_edge(graph *g, int x, int y, bool directed);

void initialize_graph(graph *g, bool directed)
{
  int i;

  g -> nvertices = 0;
  g -> nedges = 0;
  g -> directed = directed;

  for(i = 1; i< MAXV; i++) {
    g -> degree[i] = 0;
    g -> edges[i] = NULL;
  }
}

void read_graph(graph *g, bool directed)
{
  int i;
  int m;
  int x, y;

  initialize_graph(g, directed);
   
  scanf("%d %d", &(g->nvertices), &m);
  for(i=1; i<=m; i++) {
    scanf("%d %d", &x, &y);
    insert_edge(g, x, y, directed);
  }
}

void insert_edge(graph *g, int x, int y, bool directed)
{
  edgenode *p; /*temporary pointer */

  p = malloc(sizeof(edgenode));

  p->weight = 0;
  p->y = y;
  p->next = g->edges[x];

  g->edges[x] = p;
  g->degree[x] ++;

  if(directed == false)
    insert_edge(g, y, x, true);
  else
    g->nedges ++;
}

void print_graph(graph *g)
{
  int i;
  edgenode *p;

  for(i = 1; i<=g->nvertices; i++) {
    printf("%d: ",i);
    p = g->edges[i];
    while(p != NULL) {
      printf(" %d", p->y);
      p = (edgenode *)p->next;
    }
    printf("\n");
  }
}

bool processed[MAXV+1];
bool discovered[MAXV+1];
int parent[MAXV+1];

void initialize_search(graph *g)
{
  int i;

  for(i=1; i<=g->nvertices; i++) {
    processed[i] = discovered[i] = false;
    parent[i] = -1;
  }
}

void process_vertex_late(int v)
{
}

void process_vertex_early(int v)
{
  printf("processed vertex %d\n", v);
}

void process_edge(int x, int y)
{
  printf("processed edge (%d, %d)\n", x, y);
}

void bfs(graph *g, int start)
{
  queue q;
  int v;
  int y;
  edgenode *p;

  init_queue(&q);
  enqueue(&q, start);
  discovered[start] = true;
  while(empty_queue(&q) == false) {
    v = dequeue(&q);
    process_vertex_early(v);
    processed[v] = true;
    p = g->edges[v];
    while(p != NULL) {
      y = p->y;
      if((processed[y] == false) || g->directed){
          process_edge(v, y);
      }
      if(discovered[y] == false) {
        enqueue(&q, y);
        discovered[y] = true;
        parent[y] = v;
      }
      p = p->next;
    }
    process_vertex_late(v);
  }
}

void connected_components(graph *g)
{
  int c;
  int i;

  initialize_search(g);

  c = 0;
  for(i = 1; i<=g->nvertices; i++)
  {
    if(discovered[i] == false) {
      c = c+1;
      printf("Component %d:", c);
      bfs(g,i);
      printf("\n");
    }
  }
  printf("Total Components = %d", c);
}

int main(int argc, char **argv)
{
  graph *g = malloc(sizeof(graph));
  read_graph(g, false);
  print_graph(g);
  initialize_search(g);
  connected_components(g);
  return 0;
}


  
