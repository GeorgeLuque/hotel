<?php $operacion = ProcesoData::getById($_GET['id']);


//if (count($operacion) > 0 ) {
if (count(get_object_vars($operacion)) > 0 ) {
?>
    <!-- ====================================================
            ================= CONTENIDO ===============================
            ===================================================== -->
    <section id="content">

        <div class="page page-shop-single-order">

            <div class="pageheader">

                <h2>FACTURA <span>Generar e imprimir</span></h2>

                <div class="page-bar">

                    <ul class="page-breadcrumb">
                        <li>
                            <a href="index.php?view=reserva"><i class="fa fa-home"></i> Inicio</a>
                        </li>
                        <li>
                            <a href="#">Check out</a>
                        </li>
                        <li>
                            <a href="">Factura</a>
                        </li>
                    </ul>

                </div>

            </div>

            <div class="pagecontent">


                <div class="add-nav">
                    <div class="nav-heading">
                        <h3>FACTURA NRO : <strong class="text-greensea">#0000<?php echo $operacion->id; ?></strong></h3>
                        <span class="controls pull-right">
                            <a href="index.php?view=recepcion" class="btn btn-ef btn-ef-1 btn-ef-1-default btn-ef-1a btn-rounded-20 mr-5" data-toggle="tooltip" title="Recepción"><i class="fa fa-times"></i></a>
                            <!--
                                  <a href="javascript:;" class="btn btn-ef btn-ef-1 btn-ef-1-default btn-ef-1a btn-rounded-20 mr-5" data-toggle="tooltip" title="Send"><i class="fa fa-envelope"></i></a>
                                  -->
                            <a href="javascript:window.print()" class="btn btn-ef btn-ef-1 btn-ef-1-default btn-ef-1a btn-rounded-20" data-toggle="tooltip" title="Imprimir"><i class="fa fa-print"></i></a>
                        </span>
                    </div>

                    <div role="tabpanel">



                        <div class="tab-content">
                            <!-- tab in tabs -->
                            <div role="tabpanel" class="tab-pane active" id="details">

                                <?php
                                $configuracion = ConfiguracionData::getAllConfiguracion();
                               // print_r($configuracion);
                                /*
                                if(!is_array($configuracion)){
                                    $configuracion  = array();
                                }
                                */
                                //if (count(get_object_vars($configuracion)) > 0) {
                                if (is_object($configuracion) && count(get_object_vars($configuracion)) > 0) {
                                    $nombre = $configuracion->nombre;
                                    $direccion = $configuracion->direccion;
                                    $estado = $configuracion->estado;
                                    $telefono = $configuracion->telefono;
                                    $fax = $configuracion->fax;
                                    $rnc = $configuracion->rnc;
                                    $registro_empresarial = $configuracion->registro_empresarial;
                                    $ciudad = $configuracion->ciudad;

                                    $id = $configuracion->id; ?>



                                <?php } else {
                                    $nombre = '';
                                    $direccion = '';
                                    $estado = '';
                                    $telefono = '';
                                    $fax = '';
                                    $rnc = '';
                                    $registro_empresarial = '';
                                    $ciudad = '';
                                    $id = 0; ?>

                                <?php }
                                ?>

                                <!-- row -->
                                <div class="row">
                                    <!-- col -->
                                    <div class="col-md-12">


                                        <!-- tile -->
                                        <section class="tile time-simple">


                                            <!-- tile body -->
                                            <div class="tile-body">


                                                <!-- row -->
                                                <div class="row">

                                                    <!-- col -->
                                                    <div class="col-md-9">
                                                        <p class="text-default lt">Creado: <?php echo $operacion->fecha_salida; ?></p>

                                                    </div>
                                                    <!-- /col -->

                                                    <!-- col -->
                                                    <div class="col-md-3">

                                                    </div>
                                                    <!-- /col -->

                                                </div>
                                                <!-- /row -->

                                                <!-- row -->
                                                <div class="row b-t pt-20">

                                                    <!-- col -->
                                                    <div class="col-md-3 b-r">
                                                        <p class="text-uppercase text-strong mb-10 custom-font">DETALLES</p>
                                                        <ul class="list-unstyled text-default lt mb-20">

                                                            <li><b>FACTURA NRO: #0000<?php echo $operacion->id; ?></b> </li>
                                                            <li><?php echo $nombre; ?></li>
                                                            <li><?php echo $rnc; ?></li>
                                                        </ul>
                                                    </div>
                                                    <!-- /col -->

                                                    <!-- col -->
                                                    <div class="col-md-4 b-r">
                                                        <p class="text-uppercase text-strong mb-10 custom-font">
                                                            DATOS DE LA EMPRESA

                                                        </p>


                                                        <ul class="list-unstyled text-default lt mb-20">
                                                            <li><?php echo $direccion; ?> </li>

                                                            <li><?php echo $telefono; ?></li>
                                                        </ul>



                                                    </div>
                                                    <!-- /col -->

                                                    <!-- col -->
                                                    <div class="col-md-5">
                                                        <p class="text-uppercase text-strong mb-10 custom-font">Cliente</p>
                                                        <ul class="list-unstyled text-default lt mb-20">
                                                            <li><strong class="inline-block w-xs">Razon Social:</strong> <?php echo $operacion->getCliente()->razon_social; ?></li>
                                                            <li><strong class="inline-block w-xs">Ruc:</strong> <?php echo $operacion->getCliente()->giro; ?></li>
                                                            

                                                        </ul>
                                                    </div>
                                                    <!-- /col -->

                                                </div>
                                                <!-- /row -->


                                            </div>
                                            <!-- /tile body -->

                                        </section>
                                        <!-- /tile -->


                                        <!-- tile -->
                                        <section class="tile tile-simple">

                                            <!-- tile body -->
                                            <div class="tile-body p-0">

                                                <div class="table-responsive">
                                                    <table class="table table-hover table-striped">
                                                        <thead>
                                                            <tr>
                                                                <th>CANT.</th>
                                                                <th>DESCRIPCIÓN</th>
                                                                <th>P. UNITARIO</th>
                                                                <th>IMPORTE</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td><a href="javascript:;"><?php echo $operacion->cant_noche; ?></a></td>
                                                                <td><?php echo 'Alojamiento de la habitación ' . $operacion->getHabitacion()->nombre; ?></td>
                                                                <td>Gs. <?php echo number_format($operacion->precio, 0, '.', ','); ?></td>
                                                                <td class="ng-binding"><b>Gs. <?php echo number_format(($operacion->precio * $operacion->cant_noche) + $operacion->total, 0, '.', ','); ?> </b></td>

                                                            </tr>


                                                            <?php $total = 0; ?>
                                                            <?php $productos = ProcesoVentaData::getByAll($operacion->id);
                                                            if (count($productos) > 0) { ?>

                                                                <?php foreach ($productos as $producto) : ?>

                                                                    <tr>
                                                                        <td><?php echo $producto->cantidad; ?></td>
                                                                        <td><?php echo $producto->getProducto()->nombre; ?></td>
                                                                        <td>Gs. <?php echo number_format($producto->precio, 0, '.', ','); ?></td>

                                                                        <?php $sub_total = $producto->precio * $producto->cantidad; ?>

                                                                        <td><b>Gs. <?php echo number_format($sub_total, 0, '.', ','); ?></b></td>

                                                                    </tr>
                                                                    <?php $total = $sub_total + $total; ?>
                                                                <?php endforeach; ?>


                                                            <?php } else {
                                                            };
                                                            ?>

                                                        </tbody>
                                                    </table>
                                                </div>

                                            </div>
                                            <!-- /tile body -->

                                        </section>
                                        <!-- /tile -->


                                    </div>
                                    <!-- /col -->
                                </div>
                                <!-- /row -->

                                <!-- row -->
                                <div class="row">
                                    <!-- col -->
                                    <div class="col-md-3 col-md-offset-9 price-total">

                                        <!-- tile -->
                                        <section class="tile tile-simple bg-tr-black lter">

                                            <!-- tile body -->
                                            <div class="tile-body">

                                                <ul class="list-unstyled">
                                                    <?php $final = $total + (($operacion->precio * $operacion->cant_noche) + $operacion->total); ?>
                                                    <li class="ng-binding"><strong class="inline-block w-sm mb-5">Subtotal:</strong> Gs. <?php echo number_format(($final / 1.1), 0, '.', ','); ?> </li>
                                                    <li class="ng-binding"><strong class="inline-block w-sm mb-5">IVA:</strong> Gs. <?php echo number_format($final - ($final / 1.1), 0, '.', ','); ?></li>
                                                    <li class="ng-binding"><strong class="inline-block w-sm mb-5"> Total:</strong> Gs. <?php echo number_format($final, 0, '.', ','); ?></li>

                                                </ul>


                                            </div>
                                            <!-- /tile body -->

                                        </section>
                                        <!-- /tile -->

                                    </div>
                                    <!-- /col -->
                                </div>
                                <!-- /row -->



                            </div>







                        </div>
                    </div>
                </div>



            </div>

        </div>

    </section>
    <!--/ CONTENT -->

<?php } else {
};
?>