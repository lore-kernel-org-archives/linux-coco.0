Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094DF1F4621
	for <linux-coco@lists.linux.dev>; Fri, 24 Oct 2025 14:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761315636; cv=none; b=OSCGC3aZFFVayTfLeyvznXSLkDNT3UHrh64HrmMNdfvt0TrRjxy4YbQGTxr1OzuBLb8gnJibwpHpgJsUzsTQWd7NT9/StJuiBirMMYBBCsdUpqFXHliY3DViSFqTCCAboSwMbEonmGfP4ODd5azVpjfXoEmjPuxEPDctKHfmwPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761315636; c=relaxed/simple;
	bh=z7mdjeSNRMzZwFLGQ3nuykuXszU6Y70BSxWt/IzCBb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I1SIIL+gpbABZMOZ/cTDyjrme2dE4KDE+ISd45sDmol44w3dykRfhqoq1z1yyTBWQvR0s/cbap3Ad2CSgZF41ERCXHve/5ae+GEx2WauRWVGB0luB/3DrJjC00Du7IO4ouG7SAgBhTbOSw2o4tTNdoqFZ5lJu4Bj8UjwcAWRQ2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3ncg3BKq; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3ncg3BKq"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-592efe88994so6330e87.1
        for <linux-coco@lists.linux.dev>; Fri, 24 Oct 2025 07:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761315633; x=1761920433; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7mdjeSNRMzZwFLGQ3nuykuXszU6Y70BSxWt/IzCBb4=;
        b=3ncg3BKqekpYdfGISfHLpezx1oyfGqPNqJ/pnsSCVrNIcwUWvFUb9wiIZRRHxMjlG3
         +9Xqj1NJntooTHRt5q5iNc9cY8s8qTNYWbit/5Yz4CLYykmpnU/Uf+9wAxsjgDGuXg5m
         dlCaikM/8ibYWuKKgModjcM7lOrxhuwqhr/l7+jWw+Av/vaRl4wvQOihhTrqbfUE7wzG
         4wIFiLIRZkt8ydAe4sSsfSF+w0IqJN5NhUop2r/S/Ds/pf0M4EX8U4G16/pyjiohLaGf
         fu3CgVjYwdJzGdvjAMPaDzi7vUakBCEUiUYZuk/dWZByKKrnmppF40pMA+4cUkymbJVN
         5Yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761315633; x=1761920433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7mdjeSNRMzZwFLGQ3nuykuXszU6Y70BSxWt/IzCBb4=;
        b=oMeew0QeOssAUonoA30M4PgdBCEcC5XByrgGD76QmBAxxHWxIxSt0F0X1DHoapoPDX
         GmX8wFjwNIHtp+GxNVf+kEOrd8XrWk5AIxFAA7mMpWujpKoOcdh0ghpPUC5G8a8ysnTz
         C6pW2mrvTp7xY0KyMDoqCd07YinBBP+8G8BEAc0CA8q6TylpzLS/mtEZy0rR+zvgK5hn
         p2rBBqjA816qX9qVDfIlMNXTE1H9NjD7lXPChRxcAbJJn+GJ430zTPdu8dJaEfYDHi/V
         vqJL/Nlfk12C0uehOa9svJw++HQY7opitNm0MUV9CbDNSqrc1g8lQxTh9HY3FqlPBkX2
         k0/A==
X-Gm-Message-State: AOJu0YxL7lf0G0jYrzSX/QT9kgluJn9pVMONXzkHMvYPq4cWLmfUyR5k
	d9mx2CiopN8c/MySO55Y77Mrn4UF3ZDKlXlf3PweJKFU/+lJGY6j4IUhGDtJhura0/A7WAoJklh
	gX9uE1bcs0d9R0GVY3A0VcCl+QVpx8Zi1CvuuxcsL
X-Gm-Gg: ASbGncuMfUYJ2RCVlxVjyL1nmr/tffWHfcFKSdqWhUSeyj4aKayj1Xt8HPzu8taz4a3
	/mSONnWQIXl6+cFNVQKcrWO3vPWQNgWyCBEjUPjT0grH5AhhsCSKgKDqTTlsCfZvIVC9SDq9qch
	sWlTC4+E0lqxeYEwJJtevEtpDhxIE+CXMvpOM2auFNEJBJ0TitJwrK+YbKTftvx4tdnYZe8Y1gO
	3cW2deOKrKPIrOa9VS+m/kRkBho1z5AYdSKlzIiDVrZQQfvjdtXKk/lSmVh0//7cfOYcwm29AYE
	VInpY6a0aOeVs7VNF93Cyk6AqO3G
X-Google-Smtp-Source: AGHT+IFxlufZRk894FXWiVQLtDurWXJ665jIlvBcr5MuVgdWiua2ir06pFSuWEd4pNbvj8X55Y3qVw7kofkstr9vCn4=
X-Received: by 2002:ac2:5f0b:0:b0:592:ee58:60a4 with SMTP id
 2adb3069b0e04-592fb709440mr292087e87.0.1761315632854; Fri, 24 Oct 2025
 07:20:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251001022309.277238-1-chao.gao@intel.com> <20251001022309.277238-2-chao.gao@intel.com>
In-Reply-To: <20251001022309.277238-2-chao.gao@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 24 Oct 2025 07:20:18 -0700
X-Gm-Features: AS18NWBslZ-Q0nUGmswxtdkKQ6O5L9Eu7WfcDcZMdwU6h0y4vDuU8qnl7W3lDMU
Message-ID: <CAGtprH8eXwi-TcH2+-Fo5YdbEwGmgLBh9ggcDvd6N=bsKEJ_WQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/virt/tdx: Retrieve TDX module version
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, Kai Huang <kai.huang@intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 7:24=E2=80=AFPM Chao Gao <chao.gao@intel.com> wrote=
:
>
> Each TDX module is associated with a version in the x.y.z format, where x
> represents the major version, y the minor version, and z the update
> version. Knowing the running TDX module version is valuable for bug
> reporting and debugging.
>
> Retrieve the TDX module version using the existing metadata reading
> interface, in preparation for exposing it to userspace via sysfs.
>

In addition to exposing the TDX module version via sysfs, it would be
helpful to have the TDX module version captured in dmesg logs/console.
