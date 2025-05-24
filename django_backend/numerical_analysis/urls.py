from django.urls import path
from .views import NumericalAnalysisViewset

# urlpatterns = [
#     path('NumericalAnalysis/', NumericalAnalysisViewset.as_view()),
#     # path('NumericalAnalysis/<int:id>', NumericalAnalysisViewset.as_view()),
# ]

urlpatterns = [
    path('bisection/', NumericalAnalysisViewset.as_view(), name='bisection'),
    path('newtons/', NumericalAnalysisViewset.NEWTON_method, name='newtons'),
    path('secant/', NumericalAnalysisViewset.SECANT_method, name='secant'),
    path('regula_falsi/', NumericalAnalysisViewset.REGULA_falsi_method, name='regula_falsi'),
    path('jacobi/', NumericalAnalysisViewset.JACOBI_method, name='jacobi'),
    path('seidal/', NumericalAnalysisViewset.SEIDAL_method, name='seidal'),
    path('relaxation/', NumericalAnalysisViewset.RELAXATION_method, name='relaxation'),
    path('rectangle_rule/', NumericalAnalysisViewset.RECTANGLE_rule, name='rectangle_rule'),
    path('trapezoidal_rule/', NumericalAnalysisViewset.TRAPEZOIDAL_rule, name='trapezoidal_rule')

]