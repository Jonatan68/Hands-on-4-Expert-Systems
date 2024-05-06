(deftemplate Smartphone
    (slot marca)
    (slot modelo)
    (slot color)
    (slot precio)
)

(deftemplate Computador
    (slot marca)
    (slot modelo)
    (slot color)
    (slot precio)
)

(deftemplate Accesorio
    (slot tipo)
    (slot precio)
)

(deftemplate Cliente
    (slot nombre)
    (slot tipo) ; Menudista o Mayorista
)

(deftemplate OrdenCompra
    (multislot productos)
    (slot cliente)
    (slot metodoPago)
)

(deftemplate TarjetaCredito
    (slot banco)
    (slot grupo)
    (slot fechaExpiracion)
)

(deftemplate Vale
    (slot valor)
)

; Hechos
(defrule ejemploHechos
    =>
    (assert (Smartphone (marca "Apple") (modelo "iPhone15") (color "rojo") (precio 17000)))
    (assert (TarjetaCredito (banco "BBVA") (grupo "VISA") (fechaExpiracion "01-12-23")))
)

; Reglas de negocio
(defrule ofertaiPhone15
    (OrdenCompra (productos $? "smartphone" "apple" "iPhone15" $?))
    =>
    (printout t "Oferta: 24 meses sin intereses en la compra de iPhone15" crlf)
)

(defrule ofertaSamsungNote12
    (OrdenCompra (productos $? "smartphone" "samsung" "note12" $?))
    =>
    (printout t "Oferta: 12 meses sin intereses en la compra de Samsung Note12" crlf)
)

(defrule ofertaMacBookAir
    (OrdenCompra (productos $? "smartphone" "apple" "iPhone15" $?))
    =>
    (printout t "Oferta: $100 en vales por cada $1000 de compra al contado de iPhone15 y MacBookAir" crlf)
)

(defrule ofertaFundaMica
    (OrdenCompra (productos $? "smartphone" $?))
    =>
    (printout t "Oferta: Funda y mica con 15% de descuento" crlf)
)

; Razonamiento
(defrule aplicarOfertas
    (exists (ofertaiPhone15))
    =>
    (printout t "Aplicar ofertas: ofertaiPhone15" crlf)
)

(defrule aplicarDescuentos
    (exists (ofertaFundaMica))
    =>
    (printout t "Aplicar descuentos: ofertaFundaMica" crlf)
)

(defrule segmentarClientesMenudistas
    (Cliente (nombre ?nombre) (tipo "Menudista"))
    =>
    (printout t "El cliente " ?nombre " es un menudista" crlf)
)

(defrule segmentarClientesMayoristas
    (Cliente (nombre ?nombre) (tipo "Mayorista"))
    =>
    (printout t "El cliente " ?nombre " es un mayorista" crlf)
)
