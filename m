Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7952FF152
	for <linux-coco@lists.linux.dev>; Fri, 24 Oct 2025 21:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761340215; cv=none; b=IjFWGMAxWw7B2ZFkXa4UrOPTKI8BpE087AF871C8byvh7Ig8Su2QkItmIv4rVTqCuZK8CBabUkxbgktBP3ZB4hjz031o7AdGXUCioO/hYaqYOE5MCeSxNv3g5k2h9ekswkwA2WxhIGs1VoKcQqfZE4L0kiLTHUtxbF2MlBjPAyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761340215; c=relaxed/simple;
	bh=MkPNZSVcczdDm5QChyJYpThY9IObx1aM+jpgig1Em2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a5DdG9HGFxozZb52jst1eQLnHhKIZku3xbuBq1kAtS0yZvYeUia3AOhy7TzaWjgQaoGTofBp/aZ44dopyzs/YbsvO0yeX5kPmiyQ8ReuR6PW/Ewe36wOVYWiQpZn+qjLay2xQ083Z0OVj9LCD79u8Q7ZrMnm8nYbSHfq9+z3M7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gEFGQ0PM; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gEFGQ0PM"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-27eeafd4882so58735ad.0
        for <linux-coco@lists.linux.dev>; Fri, 24 Oct 2025 14:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761340211; x=1761945011; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5pDOCKMDd3GFfsZrIh/QVw1AdHwvEGb4atyHZgHAUg=;
        b=gEFGQ0PMA/v5jHid+9tJH58N6wrjwDQIs2SQDlDs6Yvu32Sa1QzwO/Y/2Tr5FcLbY0
         GwjUM2nHFxJafbQiaWDCF1b1nQSECnk5p9K3P5qKzslJMEmN9GdFyFdVWbjdTZqOyW9H
         sr6LJl4X2A3ZcGqaBjN0Gp9a0TTBROLNpwLVT/nJJcRnAiEZUlKhLTXeSZxiFugNcTvO
         VmqCP6lKzhwlKiQcLvvjZfN4bxVe1XgTX5efDTwxqqfjY3PzORc38VhLoPrISZb1rwnZ
         7u0cz0nsJdmImy1tWxtejub+Bm+2jFaJPWZE5sqbdUsLFk/mEgspKAByU860RiUmnn/d
         15wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761340211; x=1761945011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5pDOCKMDd3GFfsZrIh/QVw1AdHwvEGb4atyHZgHAUg=;
        b=j9gbM9agphsflyNiwTpAqYxI4K5JZlNDcYKQ/CNpN0YdmB5CxhTw0lANRsyMmjZjJd
         yb6aZWldsZmG8+yjUXL0wWqYXKx9GKRx8mQwJoNr28ySO5Kw8qSCpLOKRotrYm051oLa
         2ifePntB9vC79DgS5FSILqivxGXACqrSiBEW4I8pCiw9SM0lLGmtCf1Ah8VKXqGp6VXZ
         +WjU+y9HJ6sTDqn1TZbm/8bQOJ+f3Sz0bBEr2cuYLTvZrhbQxlEdPk4iZLULFvus6ZN/
         0vWMb4fpQWaCLZydSCD6h6dc3eoWy0KdKRSP0GyVnjds3p46L6cYNQhtE+1YgtXftYfm
         NggQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcCJuf57TeLNt7OFJiNi3ruP9sh5uiaYWTJEfwYtb+cbA+OD77D0H0/w62sGrARN/Cs3Q0wPtrF95L@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt9MEx5msZztdyLiioMSHgueGOMRp6C4EjeSeC86Mvi0fejL8y
	n/w0+9ItRcqb/no0TvErKeplUFQ/JTVWJOrUujOT8/NDcvzEc/PfmECd14bo/OoG0Z4bTN3XIMS
	aRKuFlAlBAA66GSN9NLL58KsJSYw4ig0CyvnOFId7
X-Gm-Gg: ASbGncsz1K2n5bGx/cPqG4/3wbWkax8CQMOOy4Ah2RyZ/m6YHnqV+Ib0OO2smHdlYYB
	4M2QSRnoNIpbKuYoaQvC9lhzwDcvAp+H/nwya7El8HAEJfQ0DK4Jwcx4rpYYWfXGmBg3rd+urhi
	Of4p8xgT5gESlVLgUVHguZKwhk+qFpIv5B43Rp8Jt83gBIBbP23PqnsiCtmzW3P71fkq0OkcxSz
	8bRoagnOTappKZnH1CNSVvZ3XWPkjeOujAuZYpuyQkZszFH5e0WObIFiZVJ7lUr6dnv4WZeFk8Y
	bZWMEgLGNk4XMWHL
X-Google-Smtp-Source: AGHT+IEDjl/7fM32vSIXahj0F5uau7/hDxLy7ltSrI+XEIC5qTttx1nPzoAjguvgNspZszxbZB4PdvHaYl8ioxX9cTI=
X-Received: by 2002:a17:902:e5d1:b0:24b:1741:1a4c with SMTP id
 d9443c01a7336-2949775c38fmr1620415ad.0.1761340210605; Fri, 24 Oct 2025
 14:10:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGtprH96B5K9Hk5h0FgxSUBa-pik=E=dLrO-4oxx76dxb9=7wQ@mail.gmail.com>
 <IA1PR11MB9495BB77A4FAFBD78600416AE7F6A@IA1PR11MB9495.namprd11.prod.outlook.com>
 <CAGtprH-h_axusSLTWsEZ6QoxgmVs0nVknqNJx-iskpsg_qHKFg@mail.gmail.com>
 <aPiEakpcADuQHqQ3@intel.com> <CAGtprH8q5U6h3p5iDYtwRiyVG_xF8hDwq6G34hLt-jhe+MRNaA@mail.gmail.com>
 <CAGtprH9bLpQQ_2UOOShd15hPwMqwW+gwo1TzczLbwGdNkcJHhg@mail.gmail.com>
 <aad8ae43-a7bd-42b2-9452-2bdee82bf0d8@intel.com> <aPsuD2fbYwCccgNi@intel.com>
 <ca688bca-df3f-4d82-97e7-20fc26f7d69e@intel.com> <68fbd63450c7c_10e910021@dwillia2-mobl4.notmuch>
 <aPvaw6NgPBq1paUh@google.com> <45c85e40-d049-4242-a251-d541e60d6e7d@intel.com>
In-Reply-To: <45c85e40-d049-4242-a251-d541e60d6e7d@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 24 Oct 2025 14:09:57 -0700
X-Gm-Features: AS18NWAjL7ozhAES4jGQUd19RUjxWASLIdpez7IMyB9H8APKVbQlFdZmtqC0Dt0
Message-ID: <CAGtprH_1CRxEUoJnU7KVrJK_Sgtq_jngxC0yRX3gVNguocZ9zg@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Runtime TDX Module update support
To: Dave Hansen <dave.hansen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, dan.j.williams@intel.com, 
	Chao Gao <chao.gao@intel.com>, Elena Reshetova <elena.reshetova@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	Reinette Chatre <reinette.chatre@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, 
	"sagis@google.com" <sagis@google.com>, "paulmck@kernel.org" <paulmck@kernel.org>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 1:14=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 10/24/25 13:00, Sean Christopherson wrote:
> > C'mon people (especially the Google folks), this is the ***exact***
> > same problem as certificate updates for SNP[1].  Y'all suggested
> > holding a lock across a userspace exit back then, and Dan's analysis
> > confirms my reaction from back then that "Holding a lock across an
> > exit to userspace seems wildly unsafe."[2]
> >
> > In the end, it took more time to understand the problem then to
> > sketch out and test a solution[3].
> >
> > Unless this somehow puts the host (kernel) at risk, this is a
> > userspace problem.
>
> If there's an similar SEV-SNP problem and accepted solution punted to
> userspace that TDX can leverage, I'm 100% on board with that. Let's do th=
at.

So IIUC, the current stance is that the kernel can rely on userspace
to ensure forward progress of TDX module update.

I still vote for the "Avoid updates during update sensitive times"
approach to be enabled in the host kernel to ensure userspace can't
mess up the TDX module state.
