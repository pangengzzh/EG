import EuclideanGeometry.Foundation.Axiom.Triangle.Basic

noncomputable section
namespace EuclidGeom

variable {P : Type _} [EuclideanPlane P] (tr : Triangle P) (tr_nd : Triangle_nd P)

namespace Triangle

def perm_vertices : (Triangle P) where
  point₁ := tr.point₂
  point₂ := tr.point₃
  point₃ := tr.point₁
  
-- We decide not to define reverse permutation of triangles, just do composition twice.

-- Permuting three times returns to the original triangle.
theorem eq_self_of_perm_vertices_three_times : tr.perm_vertices.perm_vertices.perm_vertices = tr := by sorry


-- flip vertices for triangles means to flip the second and the third vertices.

def flip_vertices : (Triangle P) where
  point₁ := tr.point₁
  point₂ := tr.point₃
  point₃ := tr.point₂

end Triangle

namespace Triangle_nd

def perm_vertices : (Triangle_nd P) := ⟨tr_nd.1.perm_vertices, flip_colinear_snd_trd.mt $ flip_colinear_fst_snd.mt tr_nd.2⟩

def flip_vertices : (Triangle_nd P) := ⟨tr_nd.1.flip_vertices, flip_colinear_snd_trd.mt tr_nd.2⟩

end Triangle_nd

theorem eq_self_of_flip_vertices_twice : tr.flip_vertices.flip_vertices = tr := by sorry

-- Not sure this is the best theorem to p
theorem eq_flip_of_perm_twice_of_perm_flip_vertices : tr.flip_vertices.perm_vertices.perm_vertices = tr.perm_vertices.flip_vertices := by sorry

-- compatibility of permutation/flip of vertices with orientation of the triangle

theorem same_orient_of_perm_vertices : tr_nd.is_cclock = (tr_nd.perm_vertices.is_cclock) := by sorry

theorem reverse_orient_of_flip_vertices : tr_nd.is_cclock = ¬ tr_nd.flip_vertices.is_cclock := by sorry

-- compatiblility of permutation/flip of vertices with inside triangle

theorem is_inside_of_is_inside_perm_vertices (tr : Triangle P) (p : P) (inside : p LiesInt tr) : p LiesInt tr.perm_vertices := by sorry

theorem is_inside_of_is_inside_flip_vertices (tr : Triangle P) (p : P) (inside : p LiesInt tr) : p LiesInt tr.flip_vertices := by sorry


/- In the following theorems, we show that the points on the interior of different edges of triangle are not equal.-/

namespace Triangle

theorem ne_vertex_of_lies_int_fst_edge (tr : Triangle P) {A : P} (h : A LiesInt tr.edge₁) : A ≠ tr.point₁ ∧  A ≠ tr.point₂ ∧ A ≠ tr.point₃ := sorry

theorem ne_vertex_of_lies_int_snd_edge (tr : Triangle P) {A : P} (h : A LiesInt tr.edge₂) : A ≠ tr.point₁ ∧  A ≠ tr.point₂ ∧ A ≠ tr.point₃ := sorry

theorem ne_vertex_of_lies_int_trd_edge (tr : Triangle P) {A : P} (h : A LiesInt tr.edge₃) : A ≠ tr.point₁ ∧  A ≠ tr.point₂ ∧ A ≠ tr.point₃ := sorry

end Triangle


theorem Triangle.lie_on_snd_and_trd_edge_of_fst_vertex (tr : Triangle P) : tr.point₁ LiesOn tr.edge₂ ∧ tr.point₁ LiesOn tr.edge₃ := sorry

theorem Triangle.lie_on_trd_and_fst_edge_of_snd_vertex (tr : Triangle P) : tr.point₁ LiesOn tr.edge₂ ∧ tr.point₁ LiesOn tr.edge₃ := sorry

theorem Triangle.lie_on_fst_and_snd_edge_of_trd_vertex (tr : Triangle P) : tr.point₁ LiesOn tr.edge₂ ∧ tr.point₁ LiesOn tr.edge₃ := sorry
namespace Triangle_nd

/- Given a nondegenerate triangle, any point that lies in the interior of the first edge does not lie on the second or the third edge. -/ 

theorem not_lie_on_snd_and_trd_of_int_fst (trind : Triangle_nd P){A : P} (h: A LiesInt trind.1.edge₁) : (¬ A LiesOn trind.1.edge₂) ∧ (¬ A LiesOn trind.1.edge₃) := sorry

theorem not_lie_on_trd_and_fst_of_int_snd (trind : Triangle_nd P) {A : P} (h: A LiesInt trind.1.edge₂) : (¬ A LiesOn trind.1.edge₃) ∧ (¬ A LiesOn trind.1.edge₁) := sorry

theorem not_lie_on_fst_and_snd_of_int_trd (trind : Triangle_nd P){A : P} (h: A LiesInt trind.1.edge₃) : (¬ A LiesOn trind.1.edge₁) ∧ (¬ A LiesOn trind.1.edge₂) := sorry


end Triangle_nd

namespace Triangle

theorem edge_eq_edge_of_flip_vertices (tr : Triangle P) : tr.edge₁.length = tr.flip_vertices.edge₁.length ∧ tr.edge₂.length = tr.flip_vertices.edge₃.length ∧ tr.edge₃.length = tr.flip_vertices.edge₂.length := by sorry

theorem edge_eq_edge_of_perm_vertices (tr : Triangle P) : tr.edge₁.length = tr.perm_vertices.edge₂.length ∧ tr.edge₂.length = tr.perm_vertices.edge₃.length ∧ tr.edge₃.length = tr.perm_vertices.edge₁.length := by sorry

end Triangle

namespace Triangle_nd

theorem edge_eq_edge_of_flip_vertices (tr_nd : Triangle_nd P) : tr_nd.1.edge₁.length = tr_nd.flip_vertices.1.edge₁.length ∧ tr_nd.1.edge₂.length = tr_nd.flip_vertices.1.edge₃.length ∧ tr_nd.1.edge₃.length = tr_nd.flip_vertices.1.edge₂.length := by sorry

theorem edge_eq_edge_of_perm_vertices (tr_nd : Triangle_nd P) : tr_nd.1.edge₁.length = tr_nd.perm_vertices.1.edge₂.length ∧ tr_nd.1.edge₂.length = tr_nd.perm_vertices.1.edge₃.length ∧ tr_nd.1.edge₃.length = tr_nd.perm_vertices.1.edge₁.length := by sorry

theorem angle_eq_neg_angle_of_flip_vertices (tr_nd : Triangle_nd P) : tr_nd.angle₁.value = - tr_nd.flip_vertices.angle₁.value ∧ tr_nd.angle₂.value = -tr_nd.flip_vertices.angle₃.value ∧ tr_nd.angle₃.value = -tr_nd.flip_vertices.angle₂.value := by sorry 

theorem angle_eq_angle_of_perm_vertices (tr_nd : Triangle_nd P) : tr_nd.angle₁.value = tr_nd.perm_vertices.angle₂.value ∧ tr_nd.angle₂.value = tr_nd.perm_vertices.angle₃.value ∧ tr_nd.angle₃.value = tr_nd.perm_vertices.angle₁.value := by sorry

end Triangle_nd

end EuclidGeom
