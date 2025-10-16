Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18F117C21E
	for <linux-coco@lists.linux.dev>; Thu, 16 Oct 2025 17:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760636888; cv=none; b=eaUa63mMV1G7xdiwDTgefuxuo7xpFLIMypwA5sK3UvMyTlUhEl85hwk2qyrX7dgwKTHtsX//W4zfpMH22ajSg2rA0yEWX/PqAgp41Kh6tuXI08YiRkcToDyr9cLN7FTf1MRUeH+EaOw5TuHo35XmawJaTuGGQ4m1TB4so4MPO9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760636888; c=relaxed/simple;
	bh=XIQCpGHFTs8D7F3SIyvmjJUsyahbXveHC0UC/BYLDKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q2DK7IjAq1a0BCv989or0wMFHf92ekdk7xJBrawtDZoJJ6jfywsknPoShm8jO6mao0gxqrI7qLYjLexS58//W5X4y2DawSRXdwNy3ihp2bQqtU6LvD5SzXPktuvv2sUsWDuYIJacN1pbEXTNyL9gtxoAwUYIqcL/rEPxlQPmz88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=crOu3HGS; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="crOu3HGS"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-27d67abd215so18545ad.0
        for <linux-coco@lists.linux.dev>; Thu, 16 Oct 2025 10:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760636886; x=1761241686; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIQCpGHFTs8D7F3SIyvmjJUsyahbXveHC0UC/BYLDKU=;
        b=crOu3HGSBjOv7Helb9UM4VKi6wC5IeKla6bDooZYpvYGv3gfNTAMRkz0YwC8FHDO+F
         leSsoQM+kr1HeyKkNagloGIa5v6asjAr4Le/BVSC5iDLwy1gXzWRx5EhIJTYd2wzM5Ei
         xzVxEdvnn+ZQP0VYSkblNdXvI+VLcaPJMky/EGcORc9p4Qy54Yz9ufDNbAAu65K+FcjV
         dmZgl6jjLSRn533y+DzomEnlcdC9foN4x7SWkxlHD0PcYhxUbengoOiaQlu6rDfcSVIA
         QcKdhM0dUb7evdXjFEUUOMxEO+3N1D9Ejh+vK31rO5b9Po2DgA1WXk7eUWFH7JyCjJXa
         8NXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760636886; x=1761241686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIQCpGHFTs8D7F3SIyvmjJUsyahbXveHC0UC/BYLDKU=;
        b=F32IK8NDy1Tni87LJwPsJmuolhYF98AELHYDw+yaUo6M7MM694O5vQK6EK5EddaI9r
         KVgZKhHQY9zd79hdLcMLbqecIym4hIVxF1HLqy+BjYXRaAZC2cSDXuERmk7iBZsZXIVS
         aQVZ6jg+VPbzpIDBGVw1rLyjXgXwhZjJMsO2isYbDz6Tm6/x2NBvRFofO9LHoYfUoqrp
         spHkxHmcqqFpo3cqFISj74DsmWszhNRWfWXNXMt0AfJ9a/84SIEPQDVBVP8VDB31hsbk
         dhTKZL9Qx1XVF0Xbdt43JUvXENfLbV4i74qd3tIpvD1H+wqpeaXR9txGuVIh1aQgbiAO
         hqeA==
X-Forwarded-Encrypted: i=1; AJvYcCVSqm2IKGHcDTNVxeUmdRxgKAxdgSL6+R8b6j90WS792arVWU1Ce5LLsMVIGxBngeR4s3ARVnckbaLA@lists.linux.dev
X-Gm-Message-State: AOJu0YyHC0nPbBRwOD8aaZs2+dHlzL80FR8g9aBon2DYbaM/mh/ADJNf
	bWoUJSaDIsGOFCjXoBHAHw7LP2MLWHHvYgWc+cTD3TCqd3iIrQuMQl1cmAL2nQ0IiO3ZKpvZWT4
	j5P49M1F8whet5t7LYn8vg1NB02nrq7YTySYbS7kF
X-Gm-Gg: ASbGncu+T3KFBO3Ar6AKunGzDM4LMld2zepjLCC/mN9Ps9fgvUE+qtMoMIEx+lPDBZ8
	0umIEmQjKtk8/8MOU6xmkpFO2c9iZjoQE66vSvOg+iGiMLkKZLWMy/HSTftjny/sISt13k7PY80
	vcISm/xwcLIw/4xlS5EboST2ZKtbEYr+WLVfiI2j9V5NR52h41CFZyt9w07otHCxFEcYdXl/jwA
	l3GBUBXW4KCRhwa4eXWWbNOCp3ycb0l19L7A3efCAa+WZmuE9SRTyavOQvl4T1eN4BeC4k9ZY9u
	WkN2OtJMSzrSqfA=
X-Google-Smtp-Source: AGHT+IHVcKL4wh6YEMgcfGrWaQIV27++i8BjLFUHYBK9dHzibsv5bCpUNLu+1lfFKvZaku1glcfoQfosqVGGAkS66zQ=
X-Received: by 2002:a17:903:2a8e:b0:268:cc5:5e44 with SMTP id
 d9443c01a7336-290879ec5acmr11967435ad.6.1760636885521; Thu, 16 Oct 2025
 10:48:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251001025442.427697-1-chao.gao@intel.com> <CAGtprH_FzXjnC0Rbctpvm2_kqAAnUOfnaT4885fBiAi7s0jcXw@mail.gmail.com>
 <IA1PR11MB949522AA3819E217C5467B51E7E8A@IA1PR11MB9495.namprd11.prod.outlook.com>
 <5b4c2bb3-cfde-4559-a59d-0ff9f2a250b4@intel.com> <IA1PR11MB94955392108F5A662D469134E7E9A@IA1PR11MB9495.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB94955392108F5A662D469134E7E9A@IA1PR11MB9495.namprd11.prod.outlook.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 16 Oct 2025 10:47:52 -0700
X-Gm-Features: AS18NWDlhMybkSceF2x0lM8xipUiMvCelI5ThZAWBI2ddK_PtsbHuGfes4sdQgg
Message-ID: <CAGtprH96B5K9Hk5h0FgxSUBa-pik=E=dLrO-4oxx76dxb9=7wQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Runtime TDX Module update support
To: "Reshetova, Elena" <elena.reshetova@intel.com>
Cc: "Hansen, Dave" <dave.hansen@intel.com>, "Gao, Chao" <chao.gao@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	"Chatre, Reinette" <reinette.chatre@intel.com>, "Weiny, Ira" <ira.weiny@intel.com>, 
	"Huang, Kai" <kai.huang@intel.com>, "Williams, Dan J" <dan.j.williams@intel.com>, 
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, "sagis@google.com" <sagis@google.com>, 
	"paulmck@kernel.org" <paulmck@kernel.org>, "nik.borisov@suse.com" <nik.borisov@suse.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 11:46=E2=80=AFPM Reshetova, Elena
<elena.reshetova@intel.com> wrote:
>
> > ...
> > > But the situation can be avoided fully, if TD preserving update is no=
t
> > conducted
> > > during the TD build time.
> >
> > Sure, and the TDX module itself could guarantee this as well as much as
> > the kernel could. It could decline to allow module updates during TD
> > builds, or error out the TD build if it collides with an update.
>
> TDX module has a functionality to decline going into SHUTDOWN state
> (pre-requisite for TD preserving update) if TD build or any problematic
> operation is in progress. It requires VMM to opt-in into this feature.

Is this opt-in enabled as part of this series? If not, what is the
mechanism to enable this opt-in?
