from django.http import JsonResponse
from rest_framework.views import APIView
from rest_framework.decorators import api_view
# VALIDATION
from django.views.decorators.csrf import csrf_exempt
# METHODS
from .rootFinding.bisection import bisection_root
from .rootFinding.newton import newton_root
from .rootFinding.secant import secant_root
from .rootFinding.regulafalsi import regulafalsi_root
from .linearEqs.jacobi import jacobi_sol
from .linearEqs.seidal import seidal_sol
from .linearEqs.relaxation import relaxation_sol
from .numericalIntegration.rectangleRule import rectangle_rule
from .numericalIntegration.trapezoidalRule import trapezoidal_rule

class NumericalAnalysisViewset(APIView):
 # --------------ROOT FINDING--------------
 # Bisection Method
 @csrf_exempt
 def post(self, request):
        if 'function' in request.data and 'a' in request.data and 'b' in request.data and 'n' in request.data:
            function = request.data['function']
            a = int(request.data['a'])
            b = int(request.data['b'])
            n = int(request.data['n'])
            return JsonResponse(bisection_root(function, a, b,n))
        else:
            return JsonResponse({'error': 'FUNCTION, INITIAL GUESS 1, INITIAL GUESS 2 and NO OF ITERATIONS are required'}, status=400)

 # Newton's Method
 @api_view(['POST'])
 @csrf_exempt
 def NEWTON_method(request, format=None):
        if 'function' in request.data and 'a' in request.data and 'b' in request.data and 'n' in request.data:
            function = request.data['function']
            a = int(request.data['a'])
            b = int(request.data['b'])
            n = int(request.data['n'])
            return JsonResponse(newton_root(function, a, b,n))
        else:
            return JsonResponse({'error': 'FUNCTION, INITIAL GUESS 1, INITIAL GUESS 2 and NO OF ITERATIONS are required'}, status=400)

 # Secant Method
 @api_view(['POST'])
 @csrf_exempt
 def SECANT_method(request, format=None):
        if 'function' in request.data and 'a' in request.data and 'b' in request.data and 'n' in request.data:
            function = request.data['function']
            a = int(request.data['a'])
            b = int(request.data['b'])
            n = int(request.data['n'])
            return JsonResponse(secant_root(function, a, b,n), status=200)
        else:
            return JsonResponse({'error': 'FUNCTION, INITIAL GUESS 1, INITIAL GUESS 2 and NO OF ITERATIONS are required'}, status=400)

 # Regula Falsi Method
 @csrf_exempt
 @api_view(['POST'])
 def REGULA_falsi_method(request, format=None):
        if 'function' in request.data and 'a' in request.data and 'b' in request.data and 'n' in request.data:
            function = request.data['function']
            a = int(request.data['a'])
            b = int(request.data['b'])
            n = int(request.data['n'])
            return JsonResponse(regulafalsi_root(function, a, b,n))
        else:
            return JsonResponse({'error': 'FUNCTION, INITIAL GUESS 1, INITIAL GUESS 2 and NO OF ITERATIONS are required'}, status=400)

 # --------------LINEAR EQUATIONS--------------
 # jacobi Method
 @csrf_exempt
 @api_view(['POST'])
 def JACOBI_method(request, format=None):
        if 'a' in request.data and 'b' in request.data and 'x0' in request.data and 'n' in request.data:
            a = request.data['a']
            b = request.data['b']
            x0 = request.data['x0']
            n = int(request.data['n'])
            return JsonResponse(jacobi_sol(a, b, x0, n))
        else:
            return JsonResponse({'error': 'MATRIX, VECTOR, INITIAL GUESS and NO OF ITERATIONS are required'}, status=400)
        

 # seidal Method
 @csrf_exempt
 @api_view(['POST'])
 def SEIDAL_method(request, format=None):
        if 'a' in request.data and 'b' in request.data and 'x0' in request.data and 'n' in request.data:
            a = request.data['a']
            b = request.data['b']
            x0 = request.data['x0']
            n = int(request.data['n'])
            return JsonResponse(seidal_sol(a, b, x0, n))
        else:
            return JsonResponse({'error': 'MATRIX, VECTOR, INITIAL GUESS and NO OF ITERATIONS are required'}, status=400)

 # relaxation Method
 @csrf_exempt
 @api_view(['POST'])
 def RELAXATION_method(request, format=None):
        if 'a' in request.data and 'b' in request.data and 'x0' in request.data and 'n' in request.data and 'w' in request.data:
            a = request.data['a']
            b = request.data['b']
            x0 = request.data['x0']
            n = int(request.data['n'])
            w = int(request.data['w'])
            return JsonResponse(relaxation_sol(a, b, x0, n, w))
        else:
            return JsonResponse({'error': 'MATRIX, VECTOR, INITIAL GUESS and NO OF ITERATIONS are required'}, status=400)
        

 # rectangle Rule
 @csrf_exempt
 @api_view(['POST'])
 def RECTANGLE_rule(request, format=None):
        if 'function' in request.data and 'a' in request.data and 'b' in request.data and 'n' in request.data and 'iteration' in request.data:
            function = request.data['function']
            a = request.data['a']
            b = request.data['b']
            n = int(request.data['n'])
            iteration = int(request.data['iteration'])
            return JsonResponse(rectangle_rule(function, a, b,n,iteration))
        else:
            return JsonResponse({'error': 'FUNCTION, LOWER LIMIT, UPPER LIMIT, NO OF POINTS and NO OF ITERATIONS are required'}, status=400)
        

 @csrf_exempt
 @api_view(['POST'])
 def TRAPEZOIDAL_rule(request, format=None):
        if 'function' in request.data and 'a' in request.data and 'b' in request.data and 'n' in request.data and 'iteration' in request.data:
            function = request.data['function']
            a = request.data['a']
            b = request.data['b']
            n = int(request.data['n'])
            iteration = int(request.data['iteration'])
            return JsonResponse(trapezoidal_rule(function, a, b,n,iteration))
        else:
            return JsonResponse({'error': 'FUNCTION, LOWER LIMIT, UPPER LIMIT, NO OF POINTS and NO OF ITERATIONS are required'}, status=400)