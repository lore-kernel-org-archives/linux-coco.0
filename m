Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73741388
	for <linux-coco@lists.linux.dev>; Sat, 18 Oct 2025 00:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760745731; cv=none; b=jcfPaYK81tlH6s0V3xI6xGXRleiOUgo2FOOvs9cc4HF6vYycg1qRlM+tuwDSv5MMUFHpV+v0iDkdj8ovDi/Uu+uNEOESXhEldUOZEN6iJO0MGNCeYJMCPJGGQM3TqPuwsV+u7pwqTl//y6KsIgfQpbdCsrIbgzpRo0bbGjnPkOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760745731; c=relaxed/simple;
	bh=PFFaPl522Tuh1RF/N52HE3b8Oto9E5SoDFOd5u3Qg7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=noxI5D3D44eT+u6wyRyacqpWPKirLB0gQeDMSVGlBwBz3FN3vmON5CXyjjHt/RTxxZ7vlq5W1Ue4Dvs63sn3TGinwnSBz/RFxA81nz9z+XiS1hTnJh2BNefQVtQnPEDdLk15ilyGQ4AOh4P3Xz7MF9AK3QgM90qCxOUQn6x4J/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=paa61k+0; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="paa61k+0"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-27eeafd4882so74345ad.0
        for <linux-coco@lists.linux.dev>; Fri, 17 Oct 2025 17:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760745729; x=1761350529; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFFaPl522Tuh1RF/N52HE3b8Oto9E5SoDFOd5u3Qg7E=;
        b=paa61k+0gfFZm1QRIKcZGab94AZPcfY0YdGz+NdSxY9GA6VgE6rz2jfe72uOpEICBL
         nlZJpDHDWcOHoNesp0WsHAHB4w1EjqcEO4hXOXEaEpixHB9XbX9LEUoMUt0kimqikeOR
         ybNc2ycbd8JQwL332DhJRGSUKV8Uzx4k7G6kUBS5w88kIc3a/JUXkKzWSYKnzDUIyjxV
         T/eUFWhJHCwI0G2RRSsZwvo0JoB7sIlRb8CKBU1GltwZdvq00UyvM/l6iNIcLvPDqYLQ
         +elT/XWKkw9L5QpGvjbWgCYh7Xrl+Mq5nAyXBm+nuJ5QqV8XPYJaKxB7mdl0N1NOFTOe
         zmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760745729; x=1761350529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFFaPl522Tuh1RF/N52HE3b8Oto9E5SoDFOd5u3Qg7E=;
        b=UXfsRdSOQGghmf37uXIHTjnHo0ehWI7APzradxLyNGXdneYyDKR4AbCRGDd3vNs151
         ZS/vNKbmU4WVm7GEXljtbMD6YmqidPnNrZe1HNzr2ofyPBCQ11uhWNJaYmb2L0ld7Hpg
         CRMSg2118ZpVeyag2yClnvr1hWMa8NEjeMk1Ud8Tqo2FDdQ1mfNLIe3KUkA7TCqGF6YU
         Qq75KqMvoBD9LP3yxIDBsp0B4O/RgxznpdJQ91Ac/w9C4AiIKTNscqQsvL0k5qWPGNeD
         w+kSKklWnL8FyAkcHCXsTANd2YdXZvDeroLmZOdVPEbu16CubUOyxPN4WxsfMwu5wx5j
         JA3w==
X-Forwarded-Encrypted: i=1; AJvYcCU+LzuO3oBzZV6sx5NBokVbs6fECpVpfY70d9vGCoV9XmWF3Qb/AffDK2Y9k2F1ZgZLYBh0lP1q6Y4e@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0hmye092v9uv7dE8DGra7f3BqOAdcsUfzil+ncLXW7CtjNj+t
	wtVxX7jFPKEqsEw7ULtAsFx1vWvKtXXF4JzoIweGKaVmT80aCUxcaxKHHI7SocDN2hzx2Byu4TX
	7QOZxlfJJfp78chWlI3kTevEl84f0NBJpJqEsfqAe
X-Gm-Gg: ASbGncvnhTUEcZxQQ6Xss6Kr79svxKFLg56dJ48+7GPvqda8TSSlJhzUP3+fojhfDVI
	XDLVzyC8jfS53uWno91ZzT0wWlF/l2QblSWcPXuWd/YY+0kYX4swqIAaBPqh0GsFvHNtptP4GIS
	MEJpo7/bjt9zf5ZdghY8QQXik0qCteu4392T0D61c2Ub8JzQl36y7uiYqMKvrQ0zD5saPlCk9sJ
	xk44dW7rBmC/C+Mla5EseSEQXIk3r0YNwUapKwgPpJ3cf7JbRUTXByeBSiUZgnWddwsIsKMCAzD
	MGwDjBg4aywe+AgMkCg6JYC8dA==
X-Google-Smtp-Source: AGHT+IGS6D0cEerAch1ZNAxH+28FjiEz6Ek4jRtm0Z30Nd4P9X26VfzqUo7NNhK4jwKy2fUMCLADwy7nvB+KqxLEqHY=
X-Received: by 2002:a17:903:230a:b0:24b:1741:1a4c with SMTP id
 d9443c01a7336-290877a3fb0mr20388215ad.0.1760745728557; Fri, 17 Oct 2025
 17:02:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251001025442.427697-1-chao.gao@intel.com> <CAGtprH_FzXjnC0Rbctpvm2_kqAAnUOfnaT4885fBiAi7s0jcXw@mail.gmail.com>
 <IA1PR11MB949522AA3819E217C5467B51E7E8A@IA1PR11MB9495.namprd11.prod.outlook.com>
 <5b4c2bb3-cfde-4559-a59d-0ff9f2a250b4@intel.com> <IA1PR11MB94955392108F5A662D469134E7E9A@IA1PR11MB9495.namprd11.prod.outlook.com>
 <CAGtprH96B5K9Hk5h0FgxSUBa-pik=E=dLrO-4oxx76dxb9=7wQ@mail.gmail.com> <IA1PR11MB9495BB77A4FAFBD78600416AE7F6A@IA1PR11MB9495.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB9495BB77A4FAFBD78600416AE7F6A@IA1PR11MB9495.namprd11.prod.outlook.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 17 Oct 2025 17:01:55 -0700
X-Gm-Features: AS18NWAQzNIk6iX2cjplI6mE1nRy77pJKpI0Ok4V-Hgp0sUCgMwBGuwBq0CrWrc
Message-ID: <CAGtprH-h_axusSLTWsEZ6QoxgmVs0nVknqNJx-iskpsg_qHKFg@mail.gmail.com>
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

On Fri, Oct 17, 2025 at 3:08=E2=80=AFAM Reshetova, Elena
<elena.reshetova@intel.com> wrote:
>
>
> > > > ...
> > > > > But the situation can be avoided fully, if TD preserving update i=
s not
> > > > conducted
> > > > > during the TD build time.
> > > >
> > > > Sure, and the TDX module itself could guarantee this as well as muc=
h as
> > > > the kernel could. It could decline to allow module updates during T=
D
> > > > builds, or error out the TD build if it collides with an update.
> > >
> > > TDX module has a functionality to decline going into SHUTDOWN state
> > > (pre-requisite for TD preserving update) if TD build or any problemat=
ic
> > > operation is in progress. It requires VMM to opt-in into this feature=
.
> >
> > Is this opt-in enabled as part of this series? If not, what is the
> > mechanism to enable this opt-in?
>
> For the information about how it works on TDX module side,
> please consult the latest ABI spec, definition of TDH.SYS.SHUTDOWN leaf,
> page 321:
> https://cdrdv2.intel.com/v1/dl/getContent/733579
>

Thanks Elena. Should the patch [1] from this series be modified to
handle the TDX module shutdown as per:
"If supported by the TDX Module, the host VMM can set the
AVOID_COMPAT_SENSITIVE flag to request the TDX Module to fail
TDH.SYS.UPDATE if any of the TDs are currently in a state that is
impacted by the update-sensitive cases"

The documentation below doesn't make sense to me:
"The compatibility checks done by TDH.SYS.UPDATE do not include the
following cases:
* If any TD was initialized by an older TDX Module that did enumerate
TDX_FEATURES0.UPDATE_COMPATIBLITY as 1, TDH.SYS.SHUTDOWN does not
check for a TD build in progress condition for that TD.
* If any TD migration session is in progress, it was initialized by an
older TDX Module that did enumerate TDX_FEATURES0.UPDATE_COMPATIBLITY
as 1"

Was it supposed to say below?
"If any TD was initialized by an older TDX Module that did enumerate
TDX_FEATURES0.UPDATE_COMPATIBLITY as 0, TDH.SYS.SHUTDOWN does not
check for a TD build in progress condition for that TD"

[1] https://lore.kernel.org/all/20251001025442.427697-15-chao.gao@intel.com=
/
