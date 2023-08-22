Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190A420EE3
	for <linux-coco@lists.linux.dev>; Tue, 22 Aug 2023 23:40:06 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-48d0ff94bc0so981001e0c.2
        for <linux-coco@lists.linux.dev>; Tue, 22 Aug 2023 16:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692747606; x=1693352406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9fey2/SAZKWN4tBo8GAjsVwAf+maA65vmFEc29W24Y=;
        b=l/S0v354GQEp1PmbZg0g5fxOWjZ8GhDalIVxtsqIbfAHakt2aMCPl+gFHIJD8CDFDd
         zoyl8+foNdCqjMs5qGsqKCMIfHyKMlGDz76DEPmRh1yBT4Usfd0zcG25xAb7YUzEVffS
         TNhbKjxyTJ/041wS7gLOuPZ+3vqcp5wMnQuJtmoyqC47SG2A7iPrR7WeEIaXKmn+oxCo
         vQhK60JHm/Rh2gtogZ2x8bqYchouVcHQC3fxWmUa/LVEnbqc5M4a+Mjds0Vxm/K5Yutm
         y7pXFwyke7hrjWGL5wZGn9LsCXdE/bfo35UYeD96jLQq/qFCB+fKoEbZIDKU4mhsSQx+
         rU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692747606; x=1693352406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9fey2/SAZKWN4tBo8GAjsVwAf+maA65vmFEc29W24Y=;
        b=QaqKMRall7py/WhwJLv+m1C41ISTy6FhO9W46nluoqLgRSgufbeS3B+lL9BKA/EqXw
         vZrq5VeLdPDH5YcADGfP2rIdDwbvpJXQe7Y07HKpHTtv8WW4VRVnM1vjp9wF9qWDo9vv
         01kOaUfnqg31DP2/r+8DSgSILCf5JuQAIeGzWR9ptMVSCjojJcbQtHVO8Ww6uJlDeagM
         NvJnC+UzUvXrV/9Qtgl/PBk0k8C0iIM6mIR/9bZV4/tPHeFmt2kMkEp6vmZQrqiuIuLJ
         g1U0fVj6XOeKG3B6aE8D3E7VKoy2rkcqJ3m3/5+MILTGfgcc1dl5hNlthJ2ndoLhMK1F
         hKAg==
X-Gm-Message-State: AOJu0YzQB4MH8CmkoZBCmP/2bi6yijCzUxOX7RcvuInRFHGg8czE1Laj
	SoCjit+JffHSlVI2dftDJRrj9X5reNwS01TY7ajcAw==
X-Google-Smtp-Source: AGHT+IE1Lm/Hd4hHIWEIkcpcLsTejX0h6P4EPSyY/N7EqW0YAOuXbIQoPYsG324TkyjrhDq924/N/2brmFGRoQF+OYo=
X-Received: by 2002:a1f:4846:0:b0:48d:1fcd:9760 with SMTP id
 v67-20020a1f4846000000b0048d1fcd9760mr6081765vka.10.1692747605648; Tue, 22
 Aug 2023 16:40:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230808162320.27297-1-kirill.shutemov@linux.intel.com>
 <ecc11d54-6aaa-f755-9436-ae15b94fb627@intel.com> <20230808200111.nz74tmschph435ri@box>
 <DM8PR11MB5750DEFF988068EFAFE28667E712A@DM8PR11MB5750.namprd11.prod.outlook.com>
 <20230809061348.vhm5ie4uzystwfya@box.shutemov.name>
In-Reply-To: <20230809061348.vhm5ie4uzystwfya@box.shutemov.name>
From: Erdem Aktas <erdemaktas@google.com>
Date: Tue, 22 Aug 2023 16:39:54 -0700
Message-ID: <CAAYXXYyuykiz80t4VO1ShdPGh=T3z0tcsV4EGG3N-rP9+4PFnA@mail.gmail.com>
Subject: Re: [PATCH] x86/tdx: Mark TSC reliable
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: "Reshetova, Elena" <elena.reshetova@intel.com>, "Hansen, Dave" <dave.hansen@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "Lutomirski, Andy" <luto@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"Nakajima, Jun" <jun.nakajima@intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Erdem Aktas <erdemaktas@google.com>

Thanks Kirill for this patch.  I think this patch is necessary to
prevent guest marking TSC as unreliable due to the possible
calibration failures at runtime. We also tested it.




On Tue, Aug 8, 2023 at 11:14=E2=80=AFPM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> On Wed, Aug 09, 2023 at 05:44:37AM +0000, Reshetova, Elena wrote:
> > >
> > > I don't know what the rules here. As far as I can see, all other cloc=
k
> > > sources relevant for TDX guest have lower rating. I guess we are fine=
?
> >
> > What about acpi_pm?
> > See this:
> > https://github.com/intel/tdx/commit/045692772ab4ef75062a83cc6e4ffa22cab=
40226
>
> clocksource_acpi_pm.rating is 200 while TSC is 300.
>
> > > There's notable exception to the rating order is kvmclock which is hi=
gher
> > > than tsc. It has to be disabled, but it is not clear to me how. This =
topic
> > > is related to how we are going to filter allowed devices/drivers, so =
I
> > > would postpone the decision until we settle on wider filtering schema=
.
> >
> > One option is to include "no-kvmclock" into kernel command line, which
> > is attested. Another option is to try to disable it explicitly, like we=
 had
> > in past:
> > https://github.com/intel/tdx/commit/6b0357f2115c1bdd158c0c8836f4f541517=
bf375
> >
> > The obvious issues with command line is that it is going to 1) grow
> > considerably if we try to disable everything we can via command line
> > and 2) there is a high chance that in practice people will not use secu=
re default
> > and/or forget to verify the correct status of cmd line. But this is to =
be
> > expected I guess for any security method that involves attestation unfo=
rtunately.
>
> I guess command line is fine, until we have coherent solution on
> filtering.
>
> --
>   Kiryl Shutsemau / Kirill A. Shutemov
