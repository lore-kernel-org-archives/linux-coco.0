Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B5518FC84
	for <linux-coco@lists.linux.dev>; Thu, 27 Feb 2025 22:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740693993; cv=none; b=nh491TsoVBJqMFxaLxfNq6ELVACQQ7sw6U53kPlqY5jCBHS4Hv1DELcxFfPU6xuP/nmyv/0RlKxCBd8YMfXXW2Xxmy9TLodpGAwM7AvbklOXPZsAT8ffs6zrEVhrXDu6e9s7QjyrSrosxEuh1J8k+WEH8tZuV1DFlz/HzHD7mkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740693993; c=relaxed/simple;
	bh=5Q9dXnV2OU7GlUBrJYgNHKi5rIDnxJLNS92uttMHlkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q3P40mZ4ZW/xg+xKJcLLCH+bmUlC4sJ4nxpfLS3ucCgVMR0VUrJyYrA2Jx/qSUyHAxsmlIS/6zKpbFjfV+F9KzPY2bXxEGEX/HiyAPKy6GTLGacraJrhCl/sZuNQZXI81WqM9YpQza0ujd0ILm6t3rfqTkkPeUJFNj2lwgVkTkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EWJm9D1X; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EWJm9D1X"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-471f1dd5b80so20351cf.1
        for <linux-coco@lists.linux.dev>; Thu, 27 Feb 2025 14:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740693990; x=1741298790; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exaIoQIbo874p+9B0DlQldEF7QdZ2qt5VRBLmXNOHJ4=;
        b=EWJm9D1Xq7p1wmGHyibvCboQbq5P5rMq9cm4VHSXYiFoQYkS3XaPQwRwwfE0WciLrD
         9VIFdMJTlWYAjKbtHH0OBGpsJIe7GrLCb57H5c7KYK1QxnmkBiVFoRLLV+lcKAGARBsH
         8uc8OztvRwxcDdC3YnXblcO4BpoKE/8bnc+BopJ9WJ2eFCrFKrYLjG6SQORxYV0D2MeI
         H+cHLYspt/OyKMu0IEkO9hLAsE/3Mebcw/+djQNOorThVTcCbGR0WVzAvJDESF28Hx2Z
         1ePt5yhzkWsbzcK+aZrjFNMps6txlOm3v/UtMVfY+4RnHnTSSRPKT6Tdd+XV8q8vFUt4
         ROoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740693990; x=1741298790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exaIoQIbo874p+9B0DlQldEF7QdZ2qt5VRBLmXNOHJ4=;
        b=JKkHbyIzrBYTHE5WYmDjbYJkriWKEQebBYqyxmt+iozhZJTx91+cr86R2veIcbtr7k
         VDjetwvtciWU24m62YqhHWw9axfOyxrt6VbsFHBy5J8dgwR5hTZveKHJ2AVyycIOnJNw
         HBShZvix9BkT8EcGHnzp332azd4NEd0OlrwCdlmMEE+UuMg1E5TTswR4jIv/ppA+HWnH
         uj9Wnsk2XWpPlmwwGYzBI16/ZfEhaPBETb0RyxryiGOJHC0CxVFpruGjm+odRfSgpGHN
         SDKHPzCB4bCSIriojQPlb2zXcRLoUEPJJ/RLW8JPWZONgSPsTt1pDg4dvEvFQg7eFVLh
         XiQw==
X-Forwarded-Encrypted: i=1; AJvYcCWbi/PkTe+IQLpCNp3UOszcfZpruPYxtFQJT3R3UtuIssERNbg8Iszij8ZXnQ4AE3D2xXdu4mGTpMu8@lists.linux.dev
X-Gm-Message-State: AOJu0YwdOpqCFRA2CaZvJQs3R4UabAN0osaQcLjAHcCP/bf29So/MP8C
	eQlyC9PxFRv5oTb55cDAaFgNlVhUeu+ItkoV312yS69ZWTNvKQgE9NIoIjrT+rp4JDYD0RhYR8i
	KWVLy6JS2J9NHXdWCgOfQA1+/bNUYX0vRmP3N
X-Gm-Gg: ASbGncutQ5AY+Tb0VKeOjDm29Sg732XGhklQXCh4/kfR1rwnMrEXNGX5oP1766aQHIA
	xwclbvvF141Bne2O2RCoo6jC4PoCfiPYPlZWfj/mBVqV7KOUaSI36TJbNF9k0ypjucGfjVdi+Bd
	VI+6ThFEqzK6DXfjZhldWFrWq/s08PxXPSufHiTg==
X-Google-Smtp-Source: AGHT+IFpvl7aZXExG5hgmgTkv/JU8rJKQ04ySfj4maggC5ukM4GdGwcgmDYXokKyoHEJUAkBvZC3g4Y6GTYUgYzvl0w=
X-Received: by 2002:a05:622a:1a8a:b0:471:eab0:ef21 with SMTP id
 d75a77b69052e-474bd0d397dmr161991cf.13.1740693990253; Thu, 27 Feb 2025
 14:06:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250223-tdx-rtmr-v2-0-f2d85b0a5f94@intel.com>
In-Reply-To: <20250223-tdx-rtmr-v2-0-f2d85b0a5f94@intel.com>
From: Jianxiong Gao <jxgao@google.com>
Date: Thu, 27 Feb 2025 14:06:18 -0800
X-Gm-Features: AQ5f1JrgX1HCGO9jxqsT5pan3n3q7ChIHAUS1azxaXTIyAjrLA-6lzFR0u6BIGk
Message-ID: <CAMGD6P2ewVZyZU26QRbhjn1ZEMHGnFhgCHq9dZyWw91R9jixnw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] tsm: Unified Measurement Register ABI for TVMs
To: Cedric Xing <cedric.xing@intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Dan Middleton <dan.middleton@linux.intel.com>, Mikko Ylinen <mikko.ylinen@linux.intel.com>, 
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 7:23=E2=80=AFPM Cedric Xing <cedric.xing@intel.com>=
 wrote:
>
> NOTE: This patch series introduces the Measurement Register (MR) ABI, and
> is a continuation of the RFC series on the same topic [1].
>
> This patch series adds a unified interface to the TSM core, allowing TVM
> (TEE VM) guest drivers to expose measurement registers (MRs) as attribute=
s
> (files) in sysfs. With this interface, applications can read and write
> (extend) MRs like regular files, enabling usages like configuration
> verification (e.g., verifying a TVM's configuration against digests store=
d
> in static/immutable MRs like MRCONFIGID on TDX or HOSTDATA on SEV) and
> runtime measurements (e.g., extending the measurement of a container imag=
e
> to an RTMR before running it).
>
> Patches included in this series:
>
> - Patch 1 adds TSM APIs for TVM guest drivers to register/expose MRs
>   through sysfs.
> - Patch 2 provides a sample module demonstrating the usage of the new TSM
>   APIs.
> - The remaining patches update the TDX guest driver to expose TDX MRs
>   through the new TSM APIs.
>
> [1]: https://lore.kernel.org/linux-coco/20241210-tsm-rtmr-v3-0-5997d4dbda=
73@intel.com/
>
> Signed-off-by: Cedric Xing <cedric.xing@intel.com>
> ---
> Changes in v2:
> - Added TSM_MR_MAXBANKS Kconfig option
> - Updated Kconfig dependency for TSM_REPORTS
> - Updated comments in include/linux/tsm.h
> - Updated drivers/virt/coco/tsm-mr.c to use `IS_BUILTIN()` for determinin=
g
>   if static buffer addresses can be converted to GPAs by `virt_to_phys()`
> - Renamed function `tdx_mcall_rtmr_extend()` -> `tdx_mcall_extend_rtmr()`
> - Link to v1: https://lore.kernel.org/r/20250212-tdx-rtmr-v1-0-9795dc49e1=
32@intel.com
>
> ---
> Cedric Xing (4):
>       tsm: Add TVM Measurement Register support
>       tsm: Add TSM measurement sample code
>       x86/tdx: Add tdx_mcall_extend_rtmr() interface
>       x86/tdx: Expose TDX MRs through TSM sysfs interface
>
>  Documentation/ABI/testing/sysfs-kernel-tsm |  20 ++
>  MAINTAINERS                                |   3 +-
>  arch/x86/coco/tdx/tdx.c                    |  36 +++
>  arch/x86/include/asm/shared/tdx.h          |   1 +
>  arch/x86/include/asm/tdx.h                 |   2 +
>  drivers/virt/coco/Kconfig                  |  17 +-
>  drivers/virt/coco/Makefile                 |   2 +
>  drivers/virt/coco/tdx-guest/Kconfig        |  24 +-
>  drivers/virt/coco/tdx-guest/tdx-guest.c    | 115 +++++++++
>  drivers/virt/coco/{tsm.c =3D> tsm-core.c}    |   6 +-
>  drivers/virt/coco/tsm-mr.c                 | 383 +++++++++++++++++++++++=
++++++
>  include/linux/tsm.h                        |  65 +++++
>  samples/Kconfig                            |  13 +
>  samples/Makefile                           |   1 +
>  samples/tsm/Makefile                       |   2 +
>  samples/tsm/tsm_mr_sample.c                | 107 ++++++++
>  16 files changed, 789 insertions(+), 8 deletions(-)
> ---
> base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
> change-id: 20250209-tdx-rtmr-255479667146
>
> Best regards,
> --
> Cedric Xing <cedric.xing@intel.com>
>
>
Tested-by: Jianxiong Gao <jxgao@google.com>
I have verified that the patchset works on Google Cloud.

--=20
Jianxiong Gao
