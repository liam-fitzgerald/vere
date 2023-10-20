#ifndef U3_VERE_MARS_H
#define U3_VERE_MARS_H

  /** Data types.
  **/
    /* u3_mars: the urbit state machine.
    */
      typedef struct _u3_mars {
        c3_d     key_d[4];                  //  disk key
        u3_disk* log_u;                     //  event log
        c3_c*    dir_c;                     //  execution directory (pier)
        c3_d     sen_d;                     //  last event requested
        c3_d     dun_d;                     //  last event processed
      } u3_mars;

    /* u3_mars_play(): replay up to [eve_d], snapshot every [sap_d].
    */
      c3_d
      u3_mars_play(u3_mars* mar_u, c3_d eve_d, c3_d sap_d);

#endif /* ifndef U3_VERE_MARS_H */
