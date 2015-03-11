!
! Module for hydraulic characteristics and water quality constituents of the basin
!
module Block_Hydro
    real, dimension(:),   allocatable::depth
    real, dimension(:),   allocatable::width
    real, dimension(:),   allocatable::u
    real, dimension(:),   allocatable::dt
    real, dimension(:),   allocatable::dx
    real, dimension(:),   allocatable::Q_in
    real, dimension(:),   allocatable::Q_trib
    real, dimension(:),   allocatable::Q_out
    real, dimension(:),   allocatable::Q_diff
    real, dimension(:,:), allocatable:: Q_nps
    real, dimension(:,:), allocatable:: temp_trib
    real, dimension(:,:), allocatable:: temp_nps,thermal
    real, dimension(:,:), allocatable:: x_dist
    real, dimension(:,:,:), allocatable:: temp

end module Block_Hydro
