import com.cargosys.app.ejb.entity.Route;
import com.cargosys.app.ejb.impl.RouteServiceBean;
import com.cargosys.app.ejb.remote.RouteService;
import jakarta.ejb.EJB;

import java.util.List;
import java.util.Random;
import java.util.UUID;

public class testFile {
    @EJB(lookup = "java:global/ear-1.0/com.cargosys.app-ejb-1.0/RouteServiceBean")
    private static RouteService routeService;

    public static void main(String[] args) {
        List<Route> allRoutes = routeService.getAllRoutes();
        System.out.println(allRoutes.size());

    }
}
