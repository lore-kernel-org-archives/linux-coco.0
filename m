Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776E0239E6B
	for <linux-coco@lists.linux.dev>; Fri, 25 Jul 2025 11:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753441702; cv=none; b=IT37zFkGGfg+oWqRYr32G9VfZMN/3RugGH6ldY/9gRP5eEP2Kog05e28Sp/ooTZg/9206QDiQdKsSQNTyXcDMmVXo7r+RhzIW0txwpZ7EUqQfyeQUPzkhbtQnN6T/u9lw9ULgpOligZ4vXFjcP9P84w7WuUS80JMZKnKXpQpTiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753441702; c=relaxed/simple;
	bh=dLVIv41rWSo97X2xoetUsogBS0HyvRd6CcH34BoydPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UAizVOvfk33vn8iZMyIHAz5/UOSQ05ezZGTCc2hJfVHkR2NJE8KehBONpdXRnRnt5mha3mZcR/r8Lbr3KfQM/60i/ztFBBc3yRKeClssOC3pKiTtaU0qF1/CK9HpuAbjJvnpAoIYDMpqOTnU/XphJlq4yAwvbCF3wDWcAoMOKu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OB4wKnTR; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OB4wKnTR"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-236192f8770so14058425ad.0
        for <linux-coco@lists.linux.dev>; Fri, 25 Jul 2025 04:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753441701; x=1754046501; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLVIv41rWSo97X2xoetUsogBS0HyvRd6CcH34BoydPw=;
        b=OB4wKnTRyVm+BIItElhjjQWBKGbN2Ggao+DbTdAmwZaIK/XXBf9H9/o86m3Vd34G+l
         kft2uPA8Cr0e8qlH3Wxl3sZwK+lbeiUhLrS1uZ5JwSsB0DdUZiUewVArqgdIDm4pBXce
         62IPBZvI2j9H/TPowJjHvkdVPy/dSiXdIAVnO1rPHG1JeWCeIfB3sWNiqLAJajOWhEHQ
         0eq5Imixjn8Hc2TCQaGZ4jUwda7OHvF6BYEdIOnPYttZPg2Sdjkfg3a6MVMJ6BGiD8Bz
         JXoMNA9C8ljX0X9EIgC6duUqxLjagcTFPJQG1ZyJZGvq+IMFMgX8PCXVixVm5RIIlwBl
         nVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753441701; x=1754046501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLVIv41rWSo97X2xoetUsogBS0HyvRd6CcH34BoydPw=;
        b=rnHWFY/J9tXUiORDM0cMZiHZZx//XcIEsYLFDSLmrSSbS4/QmNG/vfbUkW+YmdhJrU
         sw4BCF6+x8llSRZ0VRkAZD4qU8/2y5lUypndWNy4wMgVjSrljvM9Qu/UI17T1Xyt8R54
         RZ5LOTC2mvJplI4StLe4FCDII37ryNLRXyVYy8G7Y6ANGb5VFFU+3Z+kHcSeX0G5BDri
         4K8rMlw5gBw534TpiTOOlxFoHsi4iU/4GTmMCR1i0/Cv1rjO05aWNhaGMYF6xJeNRGAW
         PMHOG/LxIL+M54LsssSfG00k0SYAJAaF2DTe5NnChq1kal5BdcbrsUuyakSNCzV8StOK
         G3pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdwRk0gG/xOvMlrVeASDqMhSq8KJpjFWKe7bSIjqr2NOhtJnlik4DfGSZjF5zBLmtOFAFf+b1YfYFe@lists.linux.dev
X-Gm-Message-State: AOJu0Yy12xniPw+GWxf54HYT/IqxAxHWuPFgmMygIjzqJDfXVqVc2xZ8
	SVSgm8Wmg74qHqD0KevnqNLW3tvEnuNAZ2BLtuT6o8lj7JYomHixkX/MNfs3Cp47JfwC7ymuWSO
	lh+Fmxr0ar5ZVXF2dPpFFR05jft/6o3w=
X-Gm-Gg: ASbGncvJ6oGfKgMPnkoI8ESsoOyntatqUbLB0N5XEDWcnieLwac+IUITTOs+LcO2Zcm
	M2vxbo6JTGsfCemX0tgImpdw7sJsvGq7gE2yTezlFpR3BfvawnDjGHQCsBRo445lac7dlJY/iuW
	Nx3ntquyiFEhof+Yy59PX54rl4OeghLPh1KsG8mjvHzWteDVdog66Qnn8Vzb7CNOeGC9L4foXRk
	rty
X-Google-Smtp-Source: AGHT+IHfE0O//VX0wStE+T7I/MutBAXm3En5t6OVKcspLL/SoC/4kpBYMFjZMvwN49zLxcbne+cHozngWwP0Vh/P0xQ=
X-Received: by 2002:a17:902:ce82:b0:231:d0da:5e1f with SMTP id
 d9443c01a7336-23fb2bc6c70mr28718045ad.21.1753441700537; Fri, 25 Jul 2025
 04:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714221545.5615-1-romank@linux.microsoft.com> <20250714221545.5615-8-romank@linux.microsoft.com>
In-Reply-To: <20250714221545.5615-8-romank@linux.microsoft.com>
From: Tianyu Lan <ltykernel@gmail.com>
Date: Fri, 25 Jul 2025 19:07:44 +0800
X-Gm-Features: Ac12FXzQu8VeJjXldh1azHy1zVkvNFhCSGqwqvAy7CtaMelN_ZcDpAZXus1a6Cc
Message-ID: <CAMvTesBriJcLdxyrBbGjj0Gh1aoE84uPbnZ2DMKnmPaTtRjWqg@mail.gmail.com>
Subject: Re: [PATCH hyperv-next v4 07/16] Drivers: hv: Post messages through
 the confidential VMBus if available
To: Roman Kisel <romank@linux.microsoft.com>
Cc: alok.a.tiwari@oracle.com, arnd@arndb.de, bp@alien8.de, corbet@lwn.net, 
	dave.hansen@linux.intel.com, decui@microsoft.com, haiyangz@microsoft.com, 
	hpa@zytor.com, kys@microsoft.com, mhklinux@outlook.com, mingo@redhat.com, 
	rdunlap@infradead.org, tglx@linutronix.de, Tianyu.Lan@microsoft.com, 
	wei.liu@kernel.org, linux-arch@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, x86@kernel.org, apais@microsoft.com, 
	benhill@microsoft.com, bperkins@microsoft.com, sunilmut@microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 6:16=E2=80=AFAM Roman Kisel <romank@linux.microsoft=
.com> wrote:
>
> When the confidential VMBus is available, the guest should post
> messages to the paravisor.
>
> Update hv_post_message() to post messages to the paravisor rather than
> through GHCB or TD calls.
>
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> ---

Reviewed-by: Tianyu Lan <tiala@microsoft.com>
--=20
Thanks
Tianyu Lan
