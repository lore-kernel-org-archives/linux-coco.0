Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9464E4C8E
	for <linux-coco@lists.linux.dev>; Wed, 26 Apr 2023 16:17:05 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-640f5191c79so7797919b3a.1
        for <linux-coco@lists.linux.dev>; Wed, 26 Apr 2023 09:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682525825; x=1685117825;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UOhh7PBmE0FMhbaVbxSvnruTMoKtaFfjJSq6v0FhcXc=;
        b=MZ4nIIJTkzZdwLItB22MSQr876/ZCmOOTnCjOwMN3HdZZA2MBx0RasO5pEQ/Q/JWWd
         O3NitjTxiGvQdKCYmxRC9XFU68PNDyZBtslpXPysgDBVMUdXdMfgMmoIUzjdawjlEr2g
         qQFD2+bVu0nt4/Epppg59t1qLnYmXXAr8GqBCfXhZzFq8LVA8mzxpKkEYaGvTFX1WCdU
         u3Wgn6jcO4GlrBPeARgIe9BCGjk6FGCL2HNwRCAyyqtvc8xdH59S7McTdKDHbUBYZqmr
         Of+AcOL8IdXTBWVqOuVHuVeVNYqF9OcM9V9oG7yyhc/7SVtGpJ56+FscccIyl3JvKrJi
         bV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682525825; x=1685117825;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UOhh7PBmE0FMhbaVbxSvnruTMoKtaFfjJSq6v0FhcXc=;
        b=HPImTU3EhQSA1a0AFGi6b6/jum/BG67PaByfAjMgISKLn6f4QjDry1NlTCgMoLd4x/
         OL7US1BRqtnT7CxSZy2O1Sc82DJenGzWTOa5Je742ZwQoUqOi4uC8+YUDxJnfCvgsK5P
         e6moC7G9qVmv94Vj2XPUn5SqTkqLG7fiNDv6WiQr/5/uxoUXPWrEyy4PHIhByjBf+1cR
         3tYaLgTR/QhdDYpy517HS2aMvzOaYLBk5+8Ft7Q5A+lE6ZeIFZliwn2Gf04Vkl3IJ7A8
         UTsGM0w+zOGXH2L9/O9+Ez52pJgw/RNNQ/ZYAqCsssEbSDdOJJkCmjZwc5TtNekTLDjr
         ZTjA==
X-Gm-Message-State: AC+VfDwsZstK3RoBK0uqj1/bss3pEMQb9n6O2bWc9PWVIb/sL+3AbJbF
	7xPQT9ujgkpwcFNLtLaDq1z0RAahEpE=
X-Google-Smtp-Source: ACHHUZ5zn0kzUvAs53+qiE6+jt0LA2gWUhXUpDVyfL4k7W+HpTWTIOUbsKs80mJX/Z8nN4M4KKiZuVcHeL8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:44c9:b0:63d:24ea:4172 with SMTP id
 cv9-20020a056a0044c900b0063d24ea4172mr1075870pfb.1.1682525825009; Wed, 26 Apr
 2023 09:17:05 -0700 (PDT)
Date: Wed, 26 Apr 2023 09:17:03 -0700
In-Reply-To: <7502e1af0615c08167076ff452fc69ebf316c730.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230327141816.2648615-1-carlos.bilbao@amd.com>
 <ZEfrjtgGgm1lpadq@google.com> <DM8PR11MB575046B6DAA17B41FFED8080E7659@DM8PR11MB5750.namprd11.prod.outlook.com>
 <7502e1af0615c08167076ff452fc69ebf316c730.camel@linux.ibm.com>
Message-ID: <ZElOfzn37kmesy7e@google.com>
Subject: Re: [PATCH] docs: security: Confidential computing intro and threat model
From: Sean Christopherson <seanjc@google.com>
To: James Bottomley <jejb@linux.ibm.com>
Cc: Elena Reshetova <elena.reshetova@intel.com>, Carlos Bilbao <carlos.bilbao@amd.com>, 
	"corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ardb@kernel.org" <ardb@kernel.org>, 
	"kraxel@redhat.com" <kraxel@redhat.com>, "dovmurik@linux.ibm.com" <dovmurik@linux.ibm.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "Dhaval.Giani@amd.com" <Dhaval.Giani@amd.com>, 
	"michael.day@amd.com" <michael.day@amd.com>, 
	"pavankumar.paluri@amd.com" <pavankumar.paluri@amd.com>, "David.Kaplan@amd.com" <David.Kaplan@amd.com>, 
	"Reshma.Lal@amd.com" <Reshma.Lal@amd.com>, "Jeremy.Powell@amd.com" <Jeremy.Powell@amd.com>, 
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, 
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"dgilbert@redhat.com" <dgilbert@redhat.com>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "dinechin@redhat.com" <dinechin@redhat.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "berrange@redhat.com" <berrange@redhat.com>, 
	"mst@redhat.com" <mst@redhat.com>, "tytso@mit.edu" <tytso@mit.edu>, "jikos@kernel.org" <jikos@kernel.org>, 
	"joro@8bytes.org" <joro@8bytes.org>, "leon@kernel.org" <leon@kernel.org>, 
	"richard.weinberger@gmail.com" <richard.weinberger@gmail.com>, "lukas@wunner.de" <lukas@wunner.de>, 
	"cdupontd@redhat.com" <cdupontd@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>, 
	"sameo@rivosinc.com" <sameo@rivosinc.com>, "bp@alien8.de" <bp@alien8.de>, 
	"security@kernel.org" <security@kernel.org>, Andrew Bresticker <abrestic@rivosinc.com>, 
	Rajnesh Kanwal <rkanwal@rivosinc.com>, Dylan Reid <dylan@rivosinc.com>, 
	Ravi Sahita <ravi@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Apr 26, 2023, James Bottomley wrote:
> On Wed, 2023-04-26 at 13:32 +0000, Reshetova, Elena wrote:
> > > On Mon, Mar 27, 2023, Carlos Bilbao wrote:
> [...]
> > > > +provide stronger security guarantees to their clients (usually
> > > > referred to +as tenants) by excluding all the CSP's
> > > > infrastructure and SW out of the +tenant's Trusted Computing Base
> > > > (TCB).
> > > 
> > > This is inaccurate, the provider may still have software and/or
> > > hardware in the TCB.
> > 
> > Well, this is the end goal where we want to be,

If by "we" you mean Intel and AMD, then yes, that is probably a true statement.
But those goals have nothing to do with security.

> > the practical deployment can differ of course. We can rephrase that it
> > "allows to exclude all the CSP's infrastructure and SW out of tenant's
> > TCB." 
> 
> That's getting even more inaccurate.  To run  in a Cloud with CoCo you
> usually have to insert some provided code, like OVMF and, for AMD, the
> SVSM.  These are often customized by the CSP to suit the cloud
> infrastructure, so you're running their code.  The goal, I think, is to
> make sure you only run code you trust (some of which may come from the
> CSP) in your TCB, which is very different from the statement above.

Yes.  And taking things a step further, if we were to ask security concious users
what they would choose to have in their TCB: (a) closed-source firmware written by
a hardware vendor, or (b) open-source software that is provided by CSPs, I am
betting the overwhelming majority would choose (b).
