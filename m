Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BD518B04
	for <linux-coco@lists.linux.dev>; Wed, 11 Oct 2023 16:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mzY8HpM3"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-537f07dfe8eso13379a12.1
        for <linux-coco@lists.linux.dev>; Wed, 11 Oct 2023 09:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697040828; x=1697645628; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kM3oDlkZqJI1C9jLjkLeaJ7cZztX4vEUBGqvWjfsnbk=;
        b=mzY8HpM3y/xsCt05fTrXdQRisPiP2d31dE/wqnDpe+NE5eoXu4pBt/fatQmpXMUKkU
         7bWZab+FfjaVpcCZQikVW7oXnJiOrEojDLduI5Rg/RkoiyUBVMS+gXXkMEqOfHBxtrjq
         6svSzeigELlJ0Thq2gH2kw+T85cl+xgtAmvnES7At/tEz2flm9VjC+nExzot5JqRQS86
         o0kbDjluSVQMt6mUPxvTCRA8ysGI6nuVMEa0uFrwox3R2f9pJbedwrmnCGvZ4gCXXYEQ
         KCVcyzUAfHj75sr/LTA9WRhvAQXJKGI0hYNhywcN6+M/OkQgNEgE8FJ0DmmrqvjDG7c7
         95CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697040828; x=1697645628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kM3oDlkZqJI1C9jLjkLeaJ7cZztX4vEUBGqvWjfsnbk=;
        b=t1Kww/roPxlblmnB4tNaoJCd043ZTPpqb+EJN5BHjmd26As9LNZ2OoLPdzv3qCaAew
         hQDMXc4hAut3Jpz2dHWEfinp9NqcyhIEpkCAhUwM6rQPWnNTwg/qE4ksDUOHJobQQscu
         JwGAj20zna3JvqgxtzBDRA+7/eJHq2aZy26NJRvnC5CL4v9tQMmfJQRUtdF4NslJn83x
         jfs2G+E9v6QX7kO4qhFQ9pDEQtDgzOT7vllAmhrLeWR5I2c0CINV0Iz0N+p/5RcztN0a
         V6iFRxyXK4oA//gQESjMYICEnlWQKaiQkzf/YWHoM6F4GWr1pM1uIVXHRrM2ZcPEhJ2L
         GN9g==
X-Gm-Message-State: AOJu0YyPsWn9ZqJmI35Nv7ymqzzURM77vEuywgR9QiqyIszg+qdaNy21
	uqxmFfPSLfUxvFm2LJtJfGxTO8fYFht21rhY3V/J5Q==
X-Google-Smtp-Source: AGHT+IGzgd8Uv1LFlHWKxoTX4ZqbR3LAMg8PK1w9eNgu/DUypH1zV2peAB/M9avI96AEsJbfK0KYTBgyDgcMbOyArDw=
X-Received: by 2002:a50:9f82:0:b0:538:7038:6bdf with SMTP id
 c2-20020a509f82000000b0053870386bdfmr138725edf.1.1697040828018; Wed, 11 Oct
 2023 09:13:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169700203032.779347.11603484721811916604.stgit@dwillia2-xfh.jf.intel.com>
 <169700206636.779347.12625001287120171667.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <169700206636.779347.12625001287120171667.stgit@dwillia2-xfh.jf.intel.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 11 Oct 2023 09:13:31 -0700
Message-ID: <CAAH4kHZkWYT5i=5EVqywh7jk-00kcXu7h4vbz24fTwAm42frVg@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] virt: sevguest: Add TSM_REPORTS support for SNP_GET_EXT_REPORT
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev, Borislav Petkov <bp@alien8.de>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>, peterz@infradead.org, 
	sathyanarayanan.kuppuswamy@linux.intel.com, dave.hansen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 10:27=E2=80=AFPM Dan Williams <dan.j.williams@intel=
.com> wrote:
>
> The sevguest driver was a first mover in the confidential computing
> space. As a first mover that afforded some leeway to build the driver
> without concern for common infrastructure.
>
> Now that sevguest is no longer a singleton [1] the common operation of
> building and transmitting attestation report blobs can / should be made
> common. In this model the so called "TSM-provider" implementations can
> share a common envelope ABI even if the contents of that envelope remain
> vendor-specific. When / if the industry agrees on an attestation record
> format, that definition can also fit in the same ABI. In the meantime
> the kernel's maintenance burden is reduced and collaboration on the
> commons is increased.
>
> Convert sevguest to use CONFIG_TSM_REPORTS to retrieve the data that
> the SNP_GET_EXT_REPORT ioctl produces. An example flow follows for
> retrieving the report blob via the TSM interface utility,
> assuming no nonce and VMPL=3D=3D2:
>
>     report=3D/sys/kernel/config/tsm/report/report0
>     mkdir $report
>     echo 2 > $report/privlevel
>     dd if=3D/dev/urandom bs=3D64 count=3D1 > $report/inblob
>     hexdump -C $report/outblob
>     cat $report/certs
>     rmdir $report
>
> Given that the platform implementation is free to return empty
> certificate data if none is available it lets configfs-tsm be simplified
> as it only needs to worry about wrapping SNP_GET_EXT_REPORT, and leave
> SNP_GET_REPORT alone.
>
> The old ioctls can be lazily deprecated, the main motivation of this
> effort is to stop the proliferation of new ioctls, and to increase
> cross-vendor collaboration.
>
> Link: http://lore.kernel.org/r/64961c3baf8ce_142af829436@dwillia2-xfh.jf.=
intel.com.notmuch [1]
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Cc: Dionna Glaze <dionnaglaze@google.com>
> Cc: Brijesh Singh <brijesh.singh@amd.com>
> Cc: Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  drivers/virt/coco/sev-guest/Kconfig     |    1
>  drivers/virt/coco/sev-guest/sev-guest.c |  139 +++++++++++++++++++++++++=
++++++
>  2 files changed, 140 insertions(+)
>
> diff --git a/drivers/virt/coco/sev-guest/Kconfig b/drivers/virt/coco/sev-=
guest/Kconfig
> index da2d7ca531f0..1cffc72c41cb 100644
> --- a/drivers/virt/coco/sev-guest/Kconfig
> +++ b/drivers/virt/coco/sev-guest/Kconfig
> @@ -5,6 +5,7 @@ config SEV_GUEST
>         select CRYPTO
>         select CRYPTO_AEAD2
>         select CRYPTO_GCM
> +       select TSM_REPORTS
>         help
>           SEV-SNP firmware provides the guest a mechanism to communicate =
with
>           the PSP without risk from a malicious hypervisor who wishes to =
read,
> diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/=
sev-guest/sev-guest.c
> index e5f8f115f4af..7fdc5a774eab 100644
> --- a/drivers/virt/coco/sev-guest/sev-guest.c
> +++ b/drivers/virt/coco/sev-guest/sev-guest.c
> @@ -16,10 +16,12 @@
>  #include <linux/miscdevice.h>
>  #include <linux/set_memory.h>
>  #include <linux/fs.h>
> +#include <linux/tsm.h>
>  #include <crypto/aead.h>
>  #include <linux/scatterlist.h>
>  #include <linux/psp-sev.h>
>  #include <linux/sockptr.h>
> +#include <linux/cleanup.h>
>  #include <uapi/linux/sev-guest.h>
>  #include <uapi/linux/psp-sev.h>
>
> @@ -768,6 +770,135 @@ static u8 *get_vmpck(int id, struct snp_secrets_pag=
e_layout *layout, u32 **seqno
>         return key;
>  }
>
> +struct snp_msg_report_resp_hdr {
> +       u32 status;
> +       u32 report_size;
> +       u8 rsvd[24];
> +};
> +#define SNP_REPORT_INVALID_PARAM 0x16
> +#define SNP_REPORT_INVALID_KEY_SEL 0x27
> +
> +struct snp_msg_cert_entry {
> +       unsigned char guid[16];
> +       u32 offset;
> +       u32 length;
> +};
> +
> +static int sev_report_new(struct tsm_report *report, void *data)
> +{
> +       static const struct snp_msg_cert_entry zero_ent =3D { 0 };
> +       int certs_size =3D 0, cert_count, i, offset;
> +       struct tsm_desc *desc =3D &report->desc;
> +       struct snp_guest_dev *snp_dev =3D data;
> +       struct snp_msg_report_resp_hdr hdr;
> +       const int report_size =3D SZ_4K;
> +       const int ext_size =3D SZ_16K;
> +       int ret, size =3D report_size + ext_size;
> +       u8 *certs_address;
> +
> +       if (desc->inblob_len !=3D 64)
> +               return -EINVAL;
> +
> +       void *buf __free(kvfree) =3D kvzalloc(size, GFP_KERNEL);
> +       if (!buf)
> +               return -ENOMEM;
> +
> +       guard(mutex)(&snp_cmd_mutex);
> +
> +       /* Check if the VMPCK is not empty */
> +       if (is_vmpck_empty(snp_dev)) {
> +               dev_err_ratelimited(snp_dev->dev, "VMPCK is disabled\n");
> +               mutex_unlock(&snp_cmd_mutex);
> +               return -ENOTTY;
> +       }
> +
> +       certs_address =3D buf + report_size;
> +       struct snp_ext_report_req ext_req =3D {
> +               .data =3D { .vmpl =3D desc->privlevel },
> +               .certs_address =3D (__u64)certs_address,
> +               .certs_len =3D ext_size,
> +       };
> +       memcpy(&ext_req.data.user_data, desc->inblob, desc->inblob_len);
> +
> +       struct snp_guest_request_ioctl input =3D {
> +               .msg_version =3D 1,
> +               .req_data =3D (__u64)&ext_req,
> +               .resp_data =3D (__u64)buf,
> +               .exitinfo2 =3D 0xff,
> +       };
> +       struct snp_req_resp io =3D {
> +               .req_data =3D KERNEL_SOCKPTR(&ext_req),
> +               .resp_data =3D KERNEL_SOCKPTR(buf),
> +       };
> +
> +       ret =3D get_ext_report(snp_dev, &input, &io);
> +
> +       if (ret)
> +               return ret;
> +
> +       memcpy(&hdr, buf, sizeof(hdr));
> +       if (hdr.status =3D=3D SNP_REPORT_INVALID_PARAM)
> +               return -EINVAL;
> +       if (hdr.status =3D=3D SNP_REPORT_INVALID_KEY_SEL)
> +               return -EINVAL;
> +       if (hdr.status)
> +               return -ENXIO;
> +       if ((hdr.report_size + sizeof(hdr)) > report_size)
> +               return -ENOMEM;
> +
> +       void *rbuf __free(kvfree) =3D kvzalloc(hdr.report_size, GFP_KERNE=
L);
> +       if (!rbuf)
> +               return -ENOMEM;
> +
> +       memcpy(rbuf, buf + sizeof(hdr), hdr.report_size);
> +       report->outblob =3D no_free_ptr(rbuf);
> +       report->outblob_len =3D hdr.report_size;
> +
> +       for (i =3D 0; i < ext_size / sizeof(struct snp_msg_cert_entry); i=
++) {
> +               struct snp_msg_cert_entry *certs =3D buf + report_size;
> +
> +               if (memcmp(&certs[i], &zero_ent, sizeof(zero_ent)) =3D=3D=
 0)
> +                       break;
> +               certs_size +=3D certs[i].length;
> +       }
> +       cert_count =3D i;
> +
> +       /* No certs to report */
> +       if (cert_count =3D=3D 0)
> +               return 0;
> +
> +       /* sanity check that the entire certs table with metadata fits */
> +       if ((cert_count + 1) * sizeof(zero_ent) + certs_size > ext_size)
> +               return -ENXIO;
> +
> +       void *cbuf __free(kvfree) =3D kvzalloc(certs_size, GFP_KERNEL);
> +       if (!cbuf)
> +               return -ENOMEM;
> +
> +       /* Concatenate returned certs */
> +       for (i =3D 0, offset =3D 0; i < cert_count; i++) {
> +               struct snp_msg_cert_entry *certs =3D buf + report_size;
> +
> +               memcpy(cbuf + offset, certs_address + certs[i].offset, ce=
rts[i].length);
> +               offset +=3D certs[i].length;
> +       }

This concatenation isn't going to work since you lose the identity of
the certificates. The GUIDs of the certificate table matter, and the
concatenation isn't necessarily easily parsed out.

Consider our use case of providing not just the ARK, ASK, and VCEK
certificates, but also a non-x.509 document that is a signed golden
measurement of the firmware. We may also want to provide the VLEK so
the endorsement key selection attribute of the MSG_REPORT_REQ can be
utilized to swap between VCEK and VLEK. I don't believe your patch
here allows for that selection either.

By the GHCB specification, the host is allowed to document their own
GUIDs and provide their data to the guest in this data blob.

I think probably what's better is for the configfs to just create
GUID-named files with the contents of the entries, but I don't think
just inblob of length 64 is going to handle the VLEK/VCEK selection.

> +
> +       report->certs =3D no_free_ptr(cbuf);
> +       report->certs_len =3D certs_size;
> +
> +       return 0;
> +}
> +
> +static const struct tsm_ops sev_tsm_ops =3D {
> +       .name =3D KBUILD_MODNAME,
> +       .report_new =3D sev_report_new,
> +};
> +
> +static void unregister_sev_tsm(void *data)
> +{
> +       tsm_unregister(&sev_tsm_ops);
> +}
> +
>  static int __init sev_guest_probe(struct platform_device *pdev)
>  {
>         struct snp_secrets_page_layout *layout;
> @@ -841,6 +972,14 @@ static int __init sev_guest_probe(struct platform_de=
vice *pdev)
>         snp_dev->input.resp_gpa =3D __pa(snp_dev->response);
>         snp_dev->input.data_gpa =3D __pa(snp_dev->certs_data);
>
> +       ret =3D tsm_register(&sev_tsm_ops, snp_dev, &tsm_report_ext_type)=
;
> +       if (ret)
> +               goto e_free_cert_data;
> +
> +       ret =3D devm_add_action_or_reset(&pdev->dev, unregister_sev_tsm, =
NULL);
> +       if (ret)
> +               goto e_free_cert_data;
> +
>         ret =3D  misc_register(misc);
>         if (ret)
>                 goto e_free_cert_data;
>


--=20
-Dionna Glaze, PhD (she/her)
