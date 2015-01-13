from cmesh cimport CMesh
from cpython cimport bool
from gamesystems cimport Processor

cdef class RenderComponent:
    cdef int _component_index
    cdef RenderProcessor _processor

ctypedef struct RenderStruct:
    int tex_index_key
    int vert_index_key
    bint render
    int attrib_count
    int batch_id
    float width
    float height

cdef class RenderProcessor(Processor):
    cdef RenderComponent generate_component(self)
    cdef void clear_component(self, int component_index)
    cdef void init_component(self, int component_index, 
        bool render, int attrib_count, int vert_index_key, 
        int tex_index_key, float width, float height)
    cdef void change_allocation(self, int new_count)

cdef class RenderBatch:
    cdef list _entity_ids
    cdef int _vert_count
    cdef dict _entity_counts
    cdef int _maximum_verts
    cdef float* _batch_data
    cdef unsigned short* _batch_indices
    cdef int _index_count
    cdef int _r_index_count
    cdef int _r_vert_count
    cdef int _attrib_count
    cdef int _r_attrib_count
    cdef str _texture
    cdef CMesh _cmesh
    cdef int _batch_id

