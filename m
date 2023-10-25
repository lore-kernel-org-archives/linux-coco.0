Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0F579FD
	for <linux-coco@lists.linux.dev>; Wed, 25 Oct 2023 04:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="imiQmtoa"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c9c496c114so105025ad.0
        for <linux-coco@lists.linux.dev>; Tue, 24 Oct 2023 21:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698207289; x=1698812089; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9nBhNYbA66I1fiGsEVnFdfs5eSN3YL0v9BBPw6pXMI=;
        b=imiQmtoalx2Iqb82IU2r5RGD86R0DYHIMbolNxSY6RRnA2YPZRdyMxe71Lvb76EuwB
         bpKRVWp+0AQEHDWKoa82X2HCajvXPKA/5+fa7bBT1MeyTBbjkEgoqQ3TnXHmFtPYphj7
         lJrz4LIzuGcIIwqaZCvdJskd7s6UQmF5n26hElL4x6dP4mxXE/nQEFGygLu+tkRKWZMf
         BoFO0jBpddTFos6NSzeOxbQxfBSpm60hWQdWXjEMG4JAdmodUokSUaQUJKmhGTjaU3vz
         O1s3PiN1KxDQYSrlmky99iFdIZxHCHdlQvus12acFODm5Lo47mStjmCzwiLgJSXjMDu2
         nheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698207289; x=1698812089;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9nBhNYbA66I1fiGsEVnFdfs5eSN3YL0v9BBPw6pXMI=;
        b=ghtm3/qzrXmzh6ZfgL58v/kjAQVW89UYuT4+V5FsE8EHYDxFtosAnSVFLx8RTAAGK3
         1rHmh/25K/BXZIvbI6snEGOx69FO3J/PjbDt8vby4dwt7Q4UdqqpRK462qqHEWI+EOX5
         4ckqz5/XFPE3GWfeFtLinbQiUkTTrrCx56lxJ29Pmag9J+Ox0vCaA6XY4KeCYSXt/Bxw
         KGdJ3S6LKdSDXidoZv/OqKo6iIedhJmNEptqBV9+agYfZr7BEaFEzvTUqQHYATBJphLS
         jRC6vHDcRMz2KO+TdxY4uY1Ksul7PjUIqAQVkX10nT+xmnURtFN/1cSgvHwu5O9mejyq
         ko4Q==
X-Gm-Message-State: AOJu0Yzio3fQvfTtmN78SzrFATDU9otG7ptzQYTqB/THD3Lqm/1iU5Zc
	NJBgOCsE8Bkd5tqWuSfKTxOGiQ==
X-Google-Smtp-Source: AGHT+IHCDAucTEJicrFJdY6I20Q+LSxuUqLEWUwA01d9aMP+lfplWvXs6YT8P6P2KpjeUBWeG++i4w==
X-Received: by 2002:a17:902:e846:b0:1c9:af6a:6d0d with SMTP id t6-20020a170902e84600b001c9af6a6d0dmr61204plg.9.1698207289212;
        Tue, 24 Oct 2023 21:14:49 -0700 (PDT)
Received: from smtpclient.apple ([2601:600:847f:d220:91ed:b23f:d150:7c08])
        by smtp.gmail.com with ESMTPSA id 11-20020a17090a194b00b00276e8e4f1fbsm10705567pjh.1.2023.10.24.21.14.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Oct 2023 21:14:48 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: Re: [PATCH v7 3/7] configfs-tsm: Introduce a shared ABI for
 attestation reports
From: Qinkun Bao <qinkun@google.com>
In-Reply-To: <169776460274.1705513.13197205255470913945.stgit@dwillia2-xfh.jf.intel.com>
Date: Tue, 24 Oct 2023 21:14:37 -0700
Cc: linux-coco@lists.linux.dev,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Dionna Amalie Glaze <dionnaglaze@google.com>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Peter Gonda <pgonda@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Samuel Ortiz <sameo@rivosinc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 peterz@infradead.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org,
 kmoy@google.com,
 Chong Cai <chongc@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9483D8AA-82D5-408A-8D17-67916A880982@google.com>
References: <169776458564.1705513.13069337506739791098.stgit@dwillia2-xfh.jf.intel.com>
 <169776460274.1705513.13197205255470913945.stgit@dwillia2-xfh.jf.intel.com>
To: Dan Williams <dan.j.williams@intel.com>
X-Mailer: Apple Mail (2.3774.100.2.1.4)



> On Oct 19, 2023, at 6:16=E2=80=AFPM, Dan Williams =
<dan.j.williams@intel.com> wrote:
>=20
> One of the common operations of a TSM (Trusted Security Module) is to
> provide a way for a TVM (confidential computing guest execution
> environment) to take a measurement of its launch state, sign it and
> submit it to a verifying party. Upon successful attestation that
> verifies the integrity of the TVM additional secrets may be deployed.
> The concept is common across TSMs, but the implementations are
> unfortunately vendor specific. While the industry grapples with a =
common
> definition of this attestation format [1], Linux need not make this
> problem worse by defining a new ABI per TSM that wants to perform a
> similar operation. The current momentum has been to invent new =
ioctl-ABI
> per TSM per function which at best is an abdication of the kernel's
> responsibility to make common infrastructure concepts share common =
ABI.
>=20
> The proposal, targeted to conceptually work with TDX, SEV-SNP, COVE if
> not more, is to define a configfs interface to retrieve the =
TSM-specific
> blob.
>=20
>    report=3D/sys/kernel/config/tsm/report/report0
>    mkdir $report
>    dd if=3Dbinary_userdata_plus_nonce > $report/inblob
>    hexdump $report/outblob


The patch raised some internal discussions at Google. Some have concerns=20=

about the potential collision problems. We have reached out to Dan. Dan=20=

mentioned that =E2=80=9Cconfigfs puts some onus on userspace to avoid =
collisions=E2=80=9D.
I have listed the changes in the userspace here to ensure that we have =
the=20
correct understanding and that the complexity for the userspace is =
necessary.

Changes for the userspace:

The system administrator needs to create a new group, add users to the
group, change the folder owner, and set the permissions.

# System Administrator
groupadd tsm
report_dir=3D/sys/kernel/config/tsm/report
chown root:tsm $report_dir
chmod og-r $report_dir
chmod g+w $report_dir
# Users under the group tsm can not traverse the $report_dir=20
# but can create their dedicated interface under the $report_dir
usermod -a -G tsm user1
usermod -a -G tsm user2
=E2=80=A6

For each quote generation request, users (e.g., user1, user2) need to =
create
a temporary folder, generate the quote request and clean up the =
temporary
 directory. If any errors (crashing, not cleaning up on all exit paths) =
occur
during the quote request, the directories get left behind.


# The operation could be many times per second in the future
instance=3D$(uuidgen)
mkdir $report_dir/$instance
gen1=3D$(cat $instance/generation)
dd if=3Duser_data_A > $instance/inblob=20
hexdump -C $instance/outblob
gen2=3D$(cat $instance/generation)
# Check gen2 =3D gen1 + 1
rmdir $report_dir/$instance

>=20
> This approach later allows for the standardization of the attestation
> blob format without needing to invent a new ABI. Once standardization
> happens the standard format can be emitted by $report/outblob and
> indicated by $report/provider, or a new attribute like
> "$report/tcg_coco_report" can emit the standard format alongside the
> vendor format.
>=20
> Review of previous iterations of this interface identified that there =
is
> a need to scale report generation for multiple container environments
> [2]. Configfs enables a model where each container can bind mount one =
or
> more report generation item instances. Still, within a container only =
a
> single thread can be manipulating a given configuration instance at a
> time. A 'generation' count is provided to detect conflicts between
> multiple threads racing to configure a report instance.
>=20
> The SEV-SNP concepts of "extended reports" and "privilege levels" are
> optionally enabled by selecting 'tsm_report_ext_type' at =
register_tsm()
> time. The expectation is that those concepts are generic enough that
> they may be adopted by other TSM implementations. In other words,
> configfs-tsm aims to address a superset of TSM specific functionality
> with a common ABI where attributes may appear, or not appear, based on
> the set of concepts the implementation supports.
>=20
> Link: =
http://lore.kernel.org/r/64961c3baf8ce_142af829436@dwillia2-xfh.jf.intel.c=
om.notmuch [1]
> Link: =
http://lore.kernel.org/r/57f3a05e-8fcd-4656-beea-56bb8365ae64@linux.micros=
oft.com [2]
> Cc: Kuppuswamy Sathyanarayanan =
<sathyanarayanan.kuppuswamy@linux.intel.com>
> Cc: Dionna Amalie Glaze <dionnaglaze@google.com>
> Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
> Cc: Peter Gonda <pgonda@google.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Samuel Ortiz <sameo@rivosinc.com>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Thomas Gleixner <tglx@linutronix.de>
> Reviewed-by: Kuppuswamy Sathyanarayanan =
<sathyanarayanan.kuppuswamy@linux.intel.com>
> Tested-by: Kuppuswamy Sathyanarayanan =
<sathyanarayanan.kuppuswamy@linux.intel.com>
> Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
> Documentation/ABI/testing/configfs-tsm |   82 ++++++
> MAINTAINERS                            |    8 +
> drivers/virt/coco/Kconfig              |    5=20
> drivers/virt/coco/Makefile             |    1=20
> drivers/virt/coco/tsm.c                |  425 =
++++++++++++++++++++++++++++++++
> include/linux/tsm.h                    |   69 +++++
> 6 files changed, 590 insertions(+)
> create mode 100644 Documentation/ABI/testing/configfs-tsm
> create mode 100644 drivers/virt/coco/tsm.c
> create mode 100644 include/linux/tsm.h
>=20
> diff --git a/Documentation/ABI/testing/configfs-tsm =
b/Documentation/ABI/testing/configfs-tsm
> new file mode 100644
> index 000000000000..dd24202b5ba5
> --- /dev/null
> +++ b/Documentation/ABI/testing/configfs-tsm
> @@ -0,0 +1,82 @@
> +What:		/sys/kernel/config/tsm/report/$name/inblob
> +Date:		September, 2023
> +KernelVersion:	v6.7
> +Contact:	linux-coco@lists.linux.dev
> +Description:
> +		(WO) Up to 64 bytes of user specified binary data. For =
replay
> +		protection this should include a nonce, but the kernel =
does not
> +		place any restrictions on the content.
> +
> +What:		/sys/kernel/config/tsm/report/$name/outblob
> +Date:		September, 2023
> +KernelVersion:	v6.7
> +Contact:	linux-coco@lists.linux.dev
> +Description:
> +		(RO) Binary attestation report generated from @inblob =
and other
> +		options The format of the report is implementation =
specific
> +		where the implementation is conveyed via the @provider
> +		attribute.
> +
> +What:		/sys/kernel/config/tsm/report/$name/auxblob
> +Date:		October, 2023
> +KernelVersion:	v6.7
> +Contact:	linux-coco@lists.linux.dev
> +Description:
> +		(RO) Optional supplemental data that a TSM may emit, =
visibility
> +		of this attribute depends on TSM, and may be empty if no
> +		auxiliary data is available.
> +
> +		When @provider is "sev_guest" this file contains the
> +		"cert_table" from SEV-ES Guest-Hypervisor Communication =
Block
> +		Standardization v2.03 Section 4.1.8.1 MSG_REPORT_REQ.
> +		=
https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/speci=
fications/56421.pdf
> +
> +What:		/sys/kernel/config/tsm/report/$name/provider
> +Date:		September, 2023
> +KernelVersion:	v6.7
> +Contact:	linux-coco@lists.linux.dev
> +Description:
> +		(RO) A name for the format-specification of @outblob =
like
> +		"sev_guest" [1] or "tdx_guest" [2] in the near term, or =
a
> +		common standard format in the future.
> +
> +		[1]: SEV Secure Nested Paging Firmware ABI Specification
> +		Revision 1.55 Table 22
> +		=
https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/speci=
fications/56860.pdf
> +
> +		[2]: Intel=C2=AE Trust Domain Extensions Data Center =
Attestation
> +		Primitives : Quote Generation Library and Quote =
Verification
> +		Library Revision 0.8 Appendix 4,5
> +		=
https://download.01.org/intel-sgx/latest/dcap-latest/linux/docs/Intel_TDX_=
DCAP_Quoting_Library_API.pdf
> +
> +What:		/sys/kernel/config/tsm/report/$name/generation
> +Date:		September, 2023
> +KernelVersion:	v6.7
> +Contact:	linux-coco@lists.linux.dev
> +Description:
> +		(RO) The value in this attribute increments each time =
@inblob or
> +		any option is written. Userspace can detect conflicts by
> +		checking generation before writing to any attribute and =
making
> +		sure the number of writes matches expectations after =
reading
> +		@outblob, or it can prevent conflicts by creating a =
report
> +		instance per requesting context.
> +
> +What:		/sys/kernel/config/tsm/report/$name/privlevel
> +Date:		September, 2023
> +KernelVersion:	v6.7
> +Contact:	linux-coco@lists.linux.dev
> +Description:
> +		(WO) Attribute is visible if a TSM implementation =
provider
> +		supports the concept of attestation reports for TVMs =
running at
> +		different privilege levels, like SEV-SNP "VMPL", specify =
the
> +		privilege level via this attribute.  The minimum =
acceptable
> +		value is conveyed via @privlevel_floor and the maximum
> +		acceptable value is TSM_PRIVLEVEL_MAX (3).
> +
> +What:		=
/sys/kernel/config/tsm/report/$name/privlevel_floor
> +Date:		September, 2023
> +KernelVersion:	v6.7
> +Contact:	linux-coco@lists.linux.dev
> +Description:
> +		(RO) Indicates the minimum permissible value that can be =
written
> +		to @privlevel.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b19995690904..8acbeb029ba1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21889,6 +21889,14 @@ W:	https://github.com/srcres258/linux-doc
> T:	git git://github.com/srcres258/linux-doc.git doc-zh-tw
> F:	Documentation/translations/zh_TW/
>=20
> +TRUSTED SECURITY MODULE (TSM) ATTESTATION REPORTS
> +M:	Dan Williams <dan.j.williams@intel.com>
> +L:	linux-coco@lists.linux.dev
> +S:	Maintained
> +F:	Documentation/ABI/testing/configfs-tsm
> +F:	drivers/virt/coco/tsm.c
> +F:	include/linux/tsm.h
> +
> TTY LAYER AND SERIAL DRIVERS
> M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> M:	Jiri Slaby <jirislaby@kernel.org>
> diff --git a/drivers/virt/coco/Kconfig b/drivers/virt/coco/Kconfig
> index fc5c64f04c4a..87d142c1f932 100644
> --- a/drivers/virt/coco/Kconfig
> +++ b/drivers/virt/coco/Kconfig
> @@ -2,6 +2,11 @@
> #
> # Confidential computing related collateral
> #
> +
> +config TSM_REPORTS
> +	select CONFIGFS_FS
> +	tristate
> +
> source "drivers/virt/coco/efi_secret/Kconfig"
>=20
> source "drivers/virt/coco/sev-guest/Kconfig"
> diff --git a/drivers/virt/coco/Makefile b/drivers/virt/coco/Makefile
> index 55302ef719ad..18c1aba5edb7 100644
> --- a/drivers/virt/coco/Makefile
> +++ b/drivers/virt/coco/Makefile
> @@ -2,6 +2,7 @@
> #
> # Confidential computing related collateral
> #
> +obj-$(CONFIG_TSM_REPORTS)	+=3D tsm.o
> obj-$(CONFIG_EFI_SECRET)	+=3D efi_secret/
> obj-$(CONFIG_SEV_GUEST)		+=3D sev-guest/
> obj-$(CONFIG_INTEL_TDX_GUEST)	+=3D tdx-guest/
> diff --git a/drivers/virt/coco/tsm.c b/drivers/virt/coco/tsm.c
> new file mode 100644
> index 000000000000..d1c2db83a8ca
> --- /dev/null
> +++ b/drivers/virt/coco/tsm.c
> @@ -0,0 +1,425 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright(c) 2023 Intel Corporation. All rights reserved. */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/tsm.h>
> +#include <linux/err.h>
> +#include <linux/slab.h>
> +#include <linux/rwsem.h>
> +#include <linux/string.h>
> +#include <linux/module.h>
> +#include <linux/cleanup.h>
> +#include <linux/configfs.h>
> +
> +static struct tsm_provider {
> +	const struct tsm_ops *ops;
> +	const struct config_item_type *type;
> +	void *data;
> +} provider;
> +static DECLARE_RWSEM(tsm_rwsem);
> +
> +/**
> + * DOC: Trusted Security Module (TSM) Attestation Report Interface
> + *
> + * The TSM report interface is a common provider of blobs that =
facilitate
> + * attestation of a TVM (confidential computing guest) by an =
attestation
> + * service. A TSM report combines a user-defined blob (likely a =
public-key with
> + * a nonce for a key-exchange protocol) with a signed attestation =
report. That
> + * combined blob is then used to obtain secrets provided by an agent =
that can
> + * validate the attestation report. The expectation is that this =
interface is
> + * invoked infrequently, however configfs allows for multiple agents =
to
> + * own their own report generation instances to generate reports as
> + * often as needed.
> + *
> + * The attestation report format is TSM provider specific, when / if =
a standard
> + * materializes that can be published instead of the vendor layout. =
Until then
> + * the 'provider' attribute indicates the format of 'outblob', and =
optionally
> + * 'auxblob'.
> + */
> +
> +struct tsm_report_state {
> +	struct tsm_report report;
> +	unsigned long write_generation;
> +	unsigned long read_generation;
> +	struct config_item cfg;
> +};
> +
> +enum tsm_data_select {
> +	TSM_REPORT,
> +	TSM_CERTS,
> +};
> +
> +static struct tsm_report *to_tsm_report(struct config_item *cfg)
> +{
> +	struct tsm_report_state *state =3D
> +		container_of(cfg, struct tsm_report_state, cfg);
> +
> +	return &state->report;
> +}
> +
> +static struct tsm_report_state *to_state(struct tsm_report *report)
> +{
> +	return container_of(report, struct tsm_report_state, report);
> +}
> +
> +static int try_advance_write_generation(struct tsm_report *report)
> +{
> +	struct tsm_report_state *state =3D to_state(report);
> +
> +	lockdep_assert_held_write(&tsm_rwsem);
> +
> +	/*
> +	 * Malicious or broken userspace has written enough times for
> +	 * read_generation =3D=3D write_generation by modular arithmetic =
without an
> +	 * interim read. Stop accepting updates until the current report
> +	 * configuration is read.
> +	 */
> +	if (state->write_generation =3D=3D state->read_generation - 1)
> +		return -EBUSY;
> +	state->write_generation++;
> +	return 0;
> +}
> +
> +static ssize_t tsm_report_privlevel_store(struct config_item *cfg,
> +					  const char *buf, size_t len)
> +{
> +	struct tsm_report *report =3D to_tsm_report(cfg);
> +	unsigned int val;
> +	int rc;
> +
> +	rc =3D kstrtouint(buf, 0, &val);
> +	if (rc)
> +		return rc;
> +
> +	/*
> +	 * The valid privilege levels that a TSM might accept, if it =
accepts a
> +	 * privilege level setting at all, are a max of =
TSM_PRIVLEVEL_MAX (see
> +	 * SEV-SNP GHCB) and a minimum of a TSM selected floor value no =
less
> +	 * than 0.
> +	 */
> +	if (provider.ops->privlevel_floor > val || val > =
TSM_PRIVLEVEL_MAX)
> +		return -EINVAL;
> +
> +	guard(rwsem_write)(&tsm_rwsem);
> +	rc =3D try_advance_write_generation(report);
> +	if (rc)
> +		return rc;
> +	report->desc.privlevel =3D val;
> +
> +	return len;
> +}
> +CONFIGFS_ATTR_WO(tsm_report_, privlevel);
> +
> +static ssize_t tsm_report_privlevel_floor_show(struct config_item =
*cfg,
> +					       char *buf)
> +{
> +	guard(rwsem_read)(&tsm_rwsem);
> +	return sysfs_emit(buf, "%u\n", provider.ops->privlevel_floor);
> +}
> +CONFIGFS_ATTR_RO(tsm_report_, privlevel_floor);
> +
> +static ssize_t tsm_report_inblob_write(struct config_item *cfg,
> +				       const void *buf, size_t count)
> +{
> +	struct tsm_report *report =3D to_tsm_report(cfg);
> +	int rc;
> +
> +	guard(rwsem_write)(&tsm_rwsem);
> +	rc =3D try_advance_write_generation(report);
> +	if (rc)
> +		return rc;
> +
> +	report->desc.inblob_len =3D count;
> +	memcpy(report->desc.inblob, buf, count);
> +	return count;
> +}
> +CONFIGFS_BIN_ATTR_WO(tsm_report_, inblob, NULL, TSM_INBLOB_MAX);
> +
> +static ssize_t tsm_report_generation_show(struct config_item *cfg, =
char *buf)
> +{
> +	struct tsm_report *report =3D to_tsm_report(cfg);
> +	struct tsm_report_state *state =3D to_state(report);
> +
> +	guard(rwsem_read)(&tsm_rwsem);
> +	return sysfs_emit(buf, "%lu\n", state->write_generation);
> +}
> +CONFIGFS_ATTR_RO(tsm_report_, generation);
> +
> +static ssize_t tsm_report_provider_show(struct config_item *cfg, char =
*buf)
> +{
> +	guard(rwsem_read)(&tsm_rwsem);
> +	return sysfs_emit(buf, "%s\n", provider.ops->name);
> +}
> +CONFIGFS_ATTR_RO(tsm_report_, provider);
> +
> +static ssize_t __read_report(struct tsm_report *report, void *buf, =
size_t count,
> +			     enum tsm_data_select select)
> +{
> +	loff_t offset =3D 0;
> +	ssize_t len;
> +	u8 *out;
> +
> +	if (select =3D=3D TSM_REPORT) {
> +		out =3D report->outblob;
> +		len =3D report->outblob_len;
> +	} else {
> +		out =3D report->auxblob;
> +		len =3D report->auxblob_len;
> +	}
> +
> +	/*
> +	 * Recall that a NULL @buf is configfs requesting the size of
> +	 * the buffer.
> +	 */
> +	if (!buf)
> +		return len;
> +	return memory_read_from_buffer(buf, count, &offset, out, len);
> +}
> +
> +static ssize_t read_cached_report(struct tsm_report *report, void =
*buf,
> +				  size_t count, enum tsm_data_select =
select)
> +{
> +	struct tsm_report_state *state =3D to_state(report);
> +
> +	guard(rwsem_read)(&tsm_rwsem);
> +	if (!report->desc.inblob_len)
> +		return -EINVAL;
> +
> +	/*
> +	 * A given TSM backend always fills in ->outblob regardless of
> +	 * whether the report includes an auxblob or not.
> +	 */
> +	if (!report->outblob ||
> +	    state->read_generation !=3D state->write_generation)
> +		return -EWOULDBLOCK;
> +
> +	return __read_report(report, buf, count, select);
> +}
> +
> +static ssize_t tsm_report_read(struct tsm_report *report, void *buf,
> +			       size_t count, enum tsm_data_select =
select)
> +{
> +	struct tsm_report_state *state =3D to_state(report);
> +	const struct tsm_ops *ops;
> +	ssize_t rc;
> +
> +	/* try to read from the existing report if present and valid... =
*/
> +	rc =3D read_cached_report(report, buf, count, select);
> +	if (rc >=3D 0 || rc !=3D -EWOULDBLOCK)
> +		return rc;
> +
> +	/* slow path, report may need to be regenerated... */
> +	guard(rwsem_write)(&tsm_rwsem);
> +	ops =3D provider.ops;
> +	if (!ops)
> +		return -ENOTTY;
> +	if (!report->desc.inblob_len)
> +		return -EINVAL;
> +
> +	/* did another thread already generate this report? */
> +	if (report->outblob &&
> +	    state->read_generation =3D=3D state->write_generation)
> +		goto out;
> +
> +	kvfree(report->outblob);
> +	kvfree(report->auxblob);
> +	report->outblob =3D NULL;
> +	report->auxblob =3D NULL;
> +	rc =3D ops->report_new(report, provider.data);
> +	if (rc < 0)
> +		return rc;
> +	state->read_generation =3D state->write_generation;
> +out:
> +	return __read_report(report, buf, count, select);
> +}
> +
> +static ssize_t tsm_report_outblob_read(struct config_item *cfg, void =
*buf,
> +				       size_t count)
> +{
> +	struct tsm_report *report =3D to_tsm_report(cfg);
> +
> +	return tsm_report_read(report, buf, count, TSM_REPORT);
> +}
> +CONFIGFS_BIN_ATTR_RO(tsm_report_, outblob, NULL, TSM_OUTBLOB_MAX);
> +
> +static ssize_t tsm_report_auxblob_read(struct config_item *cfg, void =
*buf,
> +				       size_t count)
> +{
> +	struct tsm_report *report =3D to_tsm_report(cfg);
> +
> +	return tsm_report_read(report, buf, count, TSM_CERTS);
> +}
> +CONFIGFS_BIN_ATTR_RO(tsm_report_, auxblob, NULL, TSM_OUTBLOB_MAX);
> +
> +#define TSM_DEFAULT_ATTRS() \
> +	&tsm_report_attr_generation, \
> +	&tsm_report_attr_provider
> +
> +static struct configfs_attribute *tsm_report_attrs[] =3D {
> +	TSM_DEFAULT_ATTRS(),
> +	NULL,
> +};
> +
> +static struct configfs_attribute *tsm_report_extra_attrs[] =3D {
> +	TSM_DEFAULT_ATTRS(),
> +	&tsm_report_attr_privlevel,
> +	&tsm_report_attr_privlevel_floor,
> +	NULL,
> +};
> +
> +#define TSM_DEFAULT_BIN_ATTRS() \
> +	&tsm_report_attr_inblob, \
> +	&tsm_report_attr_outblob
> +
> +static struct configfs_bin_attribute *tsm_report_bin_attrs[] =3D {
> +	TSM_DEFAULT_BIN_ATTRS(),
> +	NULL,
> +};
> +
> +static struct configfs_bin_attribute *tsm_report_bin_extra_attrs[] =3D =
{
> +	TSM_DEFAULT_BIN_ATTRS(),
> +	&tsm_report_attr_auxblob,
> +	NULL,
> +};
> +
> +static void tsm_report_item_release(struct config_item *cfg)
> +{
> +	struct tsm_report *report =3D to_tsm_report(cfg);
> +	struct tsm_report_state *state =3D to_state(report);
> +
> +	kvfree(report->auxblob);
> +	kvfree(report->outblob);
> +	kfree(state);
> +}
> +
> +static struct configfs_item_operations tsm_report_item_ops =3D {
> +	.release =3D tsm_report_item_release,
> +};
> +
> +const struct config_item_type tsm_report_default_type =3D {
> +	.ct_owner =3D THIS_MODULE,
> +	.ct_bin_attrs =3D tsm_report_bin_attrs,
> +	.ct_attrs =3D tsm_report_attrs,
> +	.ct_item_ops =3D &tsm_report_item_ops,
> +};
> +EXPORT_SYMBOL_GPL(tsm_report_default_type);
> +
> +const struct config_item_type tsm_report_extra_type =3D {
> +	.ct_owner =3D THIS_MODULE,
> +	.ct_bin_attrs =3D tsm_report_bin_extra_attrs,
> +	.ct_attrs =3D tsm_report_extra_attrs,
> +	.ct_item_ops =3D &tsm_report_item_ops,
> +};
> +EXPORT_SYMBOL_GPL(tsm_report_extra_type);
> +
> +static struct config_item *tsm_report_make_item(struct config_group =
*group,
> +						const char *name)
> +{
> +	struct tsm_report_state *state;
> +
> +	guard(rwsem_read)(&tsm_rwsem);
> +	if (!provider.ops)
> +		return ERR_PTR(-ENXIO);
> +
> +	state =3D kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return ERR_PTR(-ENOMEM);
> +
> +	config_item_init_type_name(&state->cfg, name, provider.type);
> +	return &state->cfg;
> +}
> +
> +static struct configfs_group_operations tsm_report_group_ops =3D {
> +	.make_item =3D tsm_report_make_item,
> +};
> +
> +static const struct config_item_type tsm_reports_type =3D {
> +	.ct_owner =3D THIS_MODULE,
> +	.ct_group_ops =3D &tsm_report_group_ops,
> +};
> +
> +static const struct config_item_type tsm_root_group_type =3D {
> +	.ct_owner =3D THIS_MODULE,
> +};
> +
> +static struct configfs_subsystem tsm_configfs =3D {
> +	.su_group =3D {
> +		.cg_item =3D {
> +			.ci_namebuf =3D "tsm",
> +			.ci_type =3D &tsm_root_group_type,
> +		},
> +	},
> +	.su_mutex =3D __MUTEX_INITIALIZER(tsm_configfs.su_mutex),
> +};
> +
> +int tsm_register(const struct tsm_ops *ops, void *priv,
> +		 const struct config_item_type *type)
> +{
> +	const struct tsm_ops *conflict;
> +
> +	if (!type)
> +		type =3D &tsm_report_default_type;
> +	if (!(type =3D=3D &tsm_report_default_type || type =3D=3D =
&tsm_report_extra_type))
> +		return -EINVAL;
> +
> +	guard(rwsem_write)(&tsm_rwsem);
> +	conflict =3D provider.ops;
> +	if (conflict) {
> +		pr_err("\"%s\" ops already registered\n", =
conflict->name);
> +		return -EBUSY;
> +	}
> +
> +	provider.ops =3D ops;
> +	provider.data =3D priv;
> +	provider.type =3D type;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(tsm_register);
> +
> +int tsm_unregister(const struct tsm_ops *ops)
> +{
> +	guard(rwsem_write)(&tsm_rwsem);
> +	if (ops !=3D provider.ops)
> +		return -EBUSY;
> +	provider.ops =3D NULL;
> +	provider.data =3D NULL;
> +	provider.type =3D NULL;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(tsm_unregister);
> +
> +static struct config_group *tsm_report_group;
> +
> +static int __init tsm_init(void)
> +{
> +	struct config_group *root =3D &tsm_configfs.su_group;
> +	struct config_group *tsm;
> +	int rc;
> +
> +	config_group_init(root);
> +	rc =3D configfs_register_subsystem(&tsm_configfs);
> +	if (rc)
> +		return rc;
> +
> +	tsm =3D configfs_register_default_group(root, "report",
> +					      &tsm_reports_type);
> +	if (IS_ERR(tsm)) {
> +		configfs_unregister_subsystem(&tsm_configfs);
> +		return PTR_ERR(tsm);
> +	}
> +	tsm_report_group =3D tsm;
> +
> +	return 0;
> +}
> +module_init(tsm_init);
> +
> +static void __exit tsm_exit(void)
> +{
> +	configfs_unregister_default_group(tsm_report_group);
> +	configfs_unregister_subsystem(&tsm_configfs);
> +}
> +module_exit(tsm_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Provide Trusted Security Module attestation =
reports via configfs");
> diff --git a/include/linux/tsm.h b/include/linux/tsm.h
> new file mode 100644
> index 000000000000..de8324a2223c
> --- /dev/null
> +++ b/include/linux/tsm.h
> @@ -0,0 +1,69 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __TSM_H
> +#define __TSM_H
> +
> +#include <linux/sizes.h>
> +#include <linux/types.h>
> +
> +#define TSM_INBLOB_MAX 64
> +#define TSM_OUTBLOB_MAX SZ_32K
> +
> +/*
> + * Privilege level is a nested permission concept to allow =
confidential
> + * guests to partition address space, 4-levels are supported.
> + */
> +#define TSM_PRIVLEVEL_MAX 3
> +
> +/**
> + * struct tsm_desc - option descriptor for generating tsm report =
blobs
> + * @privlevel: optional privilege level to associate with @outblob
> + * @inblob_len: sizeof @inblob
> + * @inblob: arbitrary input data
> + */
> +struct tsm_desc {
> +	unsigned int privlevel;
> +	size_t inblob_len;
> +	u8 inblob[TSM_INBLOB_MAX];
> +};
> +
> +/**
> + * struct tsm_report - track state of report generation relative to =
options
> + * @desc: input parameters to @report_new()
> + * @outblob_len: sizeof(@outblob)
> + * @outblob: generated evidence to provider to the attestation agent
> + * @auxblob_len: sizeof(@auxblob)
> + * @auxblob: (optional) auxiliary data to the report (e.g. =
certificate data)
> + */
> +struct tsm_report {
> +	struct tsm_desc desc;
> +	size_t outblob_len;
> +	u8 *outblob;
> +	size_t auxblob_len;
> +	u8 *auxblob;
> +};
> +
> +/**
> + * struct tsm_ops - attributes and operations for tsm instances
> + * @name: tsm id reflected in =
/sys/kernel/config/tsm/report/$report/provider
> + * @privlevel_floor: convey base privlevel for nested scenarios
> + * @report_new: Populate @report with the report blob and auxblob
> + * (optional), return 0 on successful population, or -errno otherwise
> + *
> + * Implementation specific ops, only one is expected to be registered =
at
> + * a time i.e. only one of "sev-guest", "tdx-guest", etc.
> + */
> +struct tsm_ops {
> +	const char *name;
> +	const unsigned int privlevel_floor;
> +	int (*report_new)(struct tsm_report *report, void *data);
> +};
> +
> +extern const struct config_item_type tsm_report_default_type;
> +
> +/* publish @privlevel, @privlevel_floor, and @auxblob attributes */
> +extern const struct config_item_type tsm_report_extra_type;
> +
> +int tsm_register(const struct tsm_ops *ops, void *priv,
> +		 const struct config_item_type *type);
> +int tsm_unregister(const struct tsm_ops *ops);
> +#endif /* __TSM_H */
>=20
>=20

