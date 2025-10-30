Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406472EBB83
	for <linux-coco@lists.linux.dev>; Thu, 30 Oct 2025 21:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761861261; cv=none; b=jJhEtLcbU8yY46BEEPc9vA+cXj088U6xgsQjQCABD6sgFs3iwDPvI4t4K+VwxZMFdEotv9qntBWGjLF5LQJD+fnTJBmoD09Gk31+mWQCFxC3Aje3MsWMrjusJ4P6EPjeIUcu9E2J6Ry/9xdzTk2Pz9vDmTybpFUVr5EW1fHhoYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761861261; c=relaxed/simple;
	bh=dgOAIVkg73rBGz7X8OjJx0bSkqxgjS0ueDHpni13T8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KmhmDxGuE6XhZj93CiXAWbpQBsYU9xhpGdp4mfMAuS8vcHDKJvqrsI2e+GakLzw/q09Feo1tRqIM1CYQ0OcaDyyPOZZ3LKiIMe+I0v7BswnAOewzbfLbsJpF6DX/JruExhdWCVTyFvOjWKxA42dfhGluuw/Te4g9IkMXqMB9BSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BJDAtm8o; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BJDAtm8o"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ea12242d2eso71011cf.1
        for <linux-coco@lists.linux.dev>; Thu, 30 Oct 2025 14:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761861258; x=1762466058; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35vVAhAO0Iu5hFw32iZ9ZyKkb+r3lw2pw/7HAAL4uSo=;
        b=BJDAtm8o1GF900C0CQJIIMLfihZZGN6rTnMzF56SpoTzxBGqkbSf0I+Bu4sHDcRQ/u
         iYUtNfAALdkmtbNs2K4hwJ3bZIWKEaddDjQmFlgcb3AygKg/cmKSojY2NmAZPVsj9MZ1
         NhzyngtL3q5SZX49zyAiYxIOkWFmS0kx00JAvG0E5imxFIl+t3tm7Eo7VBkfdYh1FkKh
         5xewGr47EBV0gKLbZPCyxKIFK7a3o0csChT6FwUbywrFgdH2m3JJXvDMQiKev8IPtiBB
         Gx+FLN5ZasNt9pm0BhPlaL1G7LdWtIJ8CfIuEsZJUuVjwLcKBzpNAVC2lmhx77WS86HS
         Z0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761861258; x=1762466058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=35vVAhAO0Iu5hFw32iZ9ZyKkb+r3lw2pw/7HAAL4uSo=;
        b=c7OEGMgPS84fjALCdBV8P2VOhnu/RYYPNUGVP9IQW7Ij62QSogUc6ZWdgA6nZt8NPp
         +RWcxQ1rPoyym56yONk6W3TfUZBZezDmXBRNgSiqAzMWlC1WxW8B20odLDO+zK/l1Adw
         ObLh2HQucvfNmWesfnJ41Z6s61wcqRJaP55TkZpbc8tnvmPH0DEEGYgnetvxDWg0EwgU
         IBOW7wiQRjuoUP33TbRR6tSzfoY5E4NfmcatTzGLDMgJDFyyjMYpkwn0qGwqamklLA+U
         V8QdJZF56Gqwae/5NEsYv8enwW0vJHrU1iQZYWyByPrajUrz877yEpwXg+/+pUoqbTRI
         GHCA==
X-Gm-Message-State: AOJu0YxMMSsmuwfNJjSkyF6Mw512QkRP582bEKjko4FSVA0Xsvefl9zX
	l6G/wRuwGckUyN4G6wlOgfO7LOgPfzTtkW4U/oAl4DVw6hF/08e10tBgic1ZVBi6yY2lZjK0Rql
	nNcMmpPSk3h65XSv5RUQu+OpEfiDziLvKTP7mZ09m
X-Gm-Gg: ASbGnctFQZXPcwaj4TWmpRL6CHfQTad7YmqWTH97IviLu4h5CfAJZtI0Taj5qJS9RNo
	uOP1mquIa64q0QmwNhQbmU851OIoJ/tzkgQq6v1CI6Eej9eBuaLsJGcMTkqLqTTVsGBsfl18Hbf
	pG8PyfXzV/hFDa+hNxbHIPoVzuJ7nnVD1UcybljZv6AwGsOZflGyc2oyL597KL1Imf+Sk1uJtVZ
	BkCvHIHDbi18I4Eqzn6ZLLNlJJQRUI1gwUMHzaqDII6v0Y7XbI093ADY95cWd2g7QZgSig62zfL
	4UY79/2Khc6roYaPFEjx/jZTceXZ
X-Google-Smtp-Source: AGHT+IG21DQ+5I5E1Vup/98IJXJ8X3qN5qILfX5b/aeVHFpxaQi7Cel4HW1rzykBPe/dmDJsMrBjJEgd3AIEsBg1/PA=
X-Received: by 2002:ac8:5781:0:b0:4e6:eaea:af3f with SMTP id
 d75a77b69052e-4ed3385d22dmr839811cf.3.1761861257860; Thu, 30 Oct 2025
 14:54:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251001025442.427697-1-chao.gao@intel.com> <20251001025442.427697-8-chao.gao@intel.com>
In-Reply-To: <20251001025442.427697-8-chao.gao@intel.com>
From: Sagi Shahar <sagis@google.com>
Date: Thu, 30 Oct 2025 16:54:06 -0500
X-Gm-Features: AWmQ_blHaLmHKSZ6svRmbWXB6vejSifxbRnl-DMk68VdnViiFLwmY1_O8QThzVo
Message-ID: <CAAhR5DEQw9eMVJ_mWRP3G=XqmsR4_46xh030_Vtyx3HzWXn3wA@mail.gmail.com>
Subject: Re: [PATCH v2 07/21] coco/tdx-host: Expose P-SEAMLDR information via sysfs
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org, 
	reinette.chatre@intel.com, ira.weiny@intel.com, kai.huang@intel.com, 
	dan.j.williams@intel.com, yilun.xu@linux.intel.com, vannapurve@google.com, 
	paulmck@kernel.org, nik.borisov@suse.com, Farrah Chen <farrah.chen@intel.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 9:55=E2=80=AFPM Chao Gao <chao.gao@intel.com> wrote=
:
>
> TDX Module updates require userspace to select the appropriate module
> to load. Expose necessary information to facilitate this decision. Two
> values are needed:
>
> - P-SEAMLDR version: for compatibility checks between TDX Module and
>                      P-SEAMLDR
> - num_remaining_updates: indicates how many updates can be performed
>
> Expose them as tdx-host device attributes.
>
> Note that P-SEAMLDR sysfs nodes are hidden when INTEL_TDX_MODULE_UPDATE
> isn't enabled or when P-SEAMLDR isn't loaded by BIOS, both of which
> cause seamldr_get_info() to return NULL.
>
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Tested-by: Farrah Chen <farrah.chen@intel.com>
> ---
>  .../ABI/testing/sysfs-devices-faux-tdx-host   | 25 ++++++++
>  drivers/virt/coco/tdx-host/tdx-host.c         | 63 ++++++++++++++++++-
>  2 files changed, 87 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-devices-faux-tdx-host b/Docu=
mentation/ABI/testing/sysfs-devices-faux-tdx-host

Trying to apply this patch locally fails because
sysfs-devices-faux-tdx-host does not exist. There are also conflicts
around drivers/virt/coco/tdx-host/tdx-host.c.

I'm looking at the base commit specified in the cover letter [1] but
even the current head of the tsm/tdx tree [2] doesn't have the
sysfs-devices-faux-tdx-host file. Are there any other dependencies for
this series?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm.git/commit/?=
h=3Dtdx&id=3D9332e088937f
[2] https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm.git/tree/Doc=
umentation/ABI/testing?h=3Dtdx

> index 18d4a4a71b80..13c1f4f9909c 100644
> --- a/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
> +++ b/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
> @@ -4,3 +4,28 @@ Description:   (RO) Report the version of the loaded TDX=
 module. The TDX module
>                 version is formatted as x.y.z, where "x" is the major ver=
sion,
>                 "y" is the minor version and "z" is the update version. V=
ersions
>                 are used for bug reporting, TD-Preserving updates and etc=
.
> +
> +What:          /sys/devices/faux/tdx_host/seamldr/version
> +Contact:       linux-coco@lists.linux.dev
> +Description:   (RO) Report the version of the loaded SEAM loader. The SE=
AM
> +               loader version is formatted as x.y.z, where "x" is the ma=
jor
> +               version, "y" is the minor version and "z" is the update v=
ersion.
> +               Versions are used for bug reporting and compatibility che=
ck.
> +
> +What:          /sys/devices/faux/tdx_host/seamldr/num_remaining_updates
> +Contact:       linux-coco@lists.linux.dev
> +Description:   (RO) Report the number of remaining updates that can be p=
erformed.
> +               The CPU keeps track of TCB versions for each TDX Module t=
hat
> +               has been loaded. Since this tracking database has finite
> +               capacity, there's a maximum number of module updates that=
 can
> +               be performed.
> +
> +               After each successful update, the number reduces by one. =
Once it
> +               reaches zero, further updates will fail until next reboot=
. The
> +               number is always zero if P-SEAMLDR doesn't support update=
s.
> +
> +               See Intel=C2=AE Trust Domain Extensions - SEAM Loader (SE=
AMLDR)
> +               Interface Specification Chapter 3.3 "SEAMLDR_INFO" and Ch=
apter
> +               4.2 "SEAMLDR.INSTALL" for more information. The documenta=
tion is
> +               available at:
> +               https://cdrdv2-public.intel.com/739045/intel-tdx-seamldr-=
interface-specification.pdf
> diff --git a/drivers/virt/coco/tdx-host/tdx-host.c b/drivers/virt/coco/td=
x-host/tdx-host.c
> index 968a19f4e01a..42570c5b221b 100644
> --- a/drivers/virt/coco/tdx-host/tdx-host.c
> +++ b/drivers/virt/coco/tdx-host/tdx-host.c
> @@ -11,6 +11,7 @@
>  #include <linux/sysfs.h>
>  #include <linux/device/faux.h>
>  #include <asm/cpu_device_id.h>
> +#include <asm/seamldr.h>
>  #include <asm/tdx.h>
>  #include <asm/tdx_global_metadata.h>
>
> @@ -43,7 +44,67 @@ static struct attribute *tdx_host_attrs[] =3D {
>         &dev_attr_version.attr,
>         NULL,
>  };
> -ATTRIBUTE_GROUPS(tdx_host);
> +
> +struct attribute_group tdx_host_group =3D {
> +       .attrs =3D tdx_host_attrs,
> +};
> +
> +static ssize_t seamldr_version_show(struct device *dev, struct device_at=
tribute *attr,
> +                                   char *buf)
> +{
> +       const struct seamldr_info *info =3D seamldr_get_info();
> +
> +       if (!info)
> +               return -ENXIO;
> +
> +       return sysfs_emit(buf, "%u.%u.%u\n", info->major_version,
> +                                            info->minor_version,
> +                                            info->update_version);
> +}
> +
> +static ssize_t num_remaining_updates_show(struct device *dev,
> +                                         struct device_attribute *attr,
> +                                         char *buf)
> +{
> +       const struct seamldr_info *info =3D seamldr_get_info();
> +
> +       if (!info)
> +               return -ENXIO;
> +
> +       return sysfs_emit(buf, "%u\n", info->num_remaining_updates);
> +}
> +
> +/*
> + * Open-code DEVICE_ATTR_RO to specify a different 'show' function for
> + * P-SEAMLDR version as version_show() is used for the TDX Module versio=
n.
> + */
> +static struct device_attribute dev_attr_seamldr_version =3D
> +       __ATTR(version, 0444, seamldr_version_show, NULL);
> +static DEVICE_ATTR_RO(num_remaining_updates);
> +
> +static struct attribute *seamldr_attrs[] =3D {
> +       &dev_attr_seamldr_version.attr,
> +       &dev_attr_num_remaining_updates.attr,
> +       NULL,
> +};
> +
> +static umode_t seamldr_group_is_visible(struct kobject *kobj,
> +                                       struct attribute *attr, int n)
> +{
> +       return seamldr_get_info() ? attr->mode : 0;
> +}
> +
> +static struct attribute_group seamldr_group =3D {
> +       .name =3D "seamldr",
> +       .attrs =3D seamldr_attrs,
> +       .is_visible =3D seamldr_group_is_visible,
> +};
> +
> +static const struct attribute_group *tdx_host_groups[] =3D {
> +       &tdx_host_group,
> +       &seamldr_group,
> +       NULL,
> +};
>
>  static int __init tdx_host_init(void)
>  {
> --
> 2.47.3
>
