Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7891D6FB9
	for <linux-coco@lists.linux.dev>; Thu, 27 Apr 2023 15:19:00 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-528542b1273so3041594a12.0
        for <linux-coco@lists.linux.dev>; Thu, 27 Apr 2023 08:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682608740; x=1685200740;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96tlb4cNoJcCgE10H273pQD9ijy1ih2oOSASLKRE9RA=;
        b=B9P9p3oRb2CBdbm9CWbdyCK/nucae2EGpAlsCblo9mDN/lRgWAN1Ku83ChZU2ku51u
         cGwtpxaxyImwGmJEELqwjCR6CGLc9sOte9monJrlajGAoE1pJ6SeoiZSvRtIoJ+OCQSX
         dfUwJWtlglsocmLoe845ime1ijnnxnvtZKim/+b4RXAFbO9BFmwr7dI1QbQtHFCndLwJ
         z8AURsfaSLu2ANG9zFM0ST7XfiJDzeTma2VWGadUlaZOleBVWHNHQ5yMYOQF1lEQU41t
         h8qG0FzNgrhAlLIfeZhVWv9bqFG1rL5s1nnQYpYTJ8mz0+YDtrn7H4NbsY4ROx8OVLAE
         Ezjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682608740; x=1685200740;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=96tlb4cNoJcCgE10H273pQD9ijy1ih2oOSASLKRE9RA=;
        b=AdfXo+royzP7CAz0x56UvAhHCIHrpBbTmrINxVEDQPM50kJpEgR1PyoEM6eDkwBNN6
         /WZ+eJva7MflCh0PyigYjuzhPrB/cD0uAWs9Pj5X5yC5B9JyFWAfrHYCrA3mj+XZPFA0
         EU/++QcHXs/ZgXfrFpV48urCGudROcD0QbwIPDKEshTGXQ7RdLSSefHZ9wa3zrYl0Emb
         9TzXn66KUZyCRlIp0IV0zo9exJHvYPnDqylR62+hxU+Mzg326sa/w7f4kQfKrTVP9Lru
         c9Bl3Vp74KggW2YbvJiuVB+DWqFbwh9S0k/SGYfce4vXiFXa4z/LMjNnp3Rv+VwFswfs
         wfgg==
X-Gm-Message-State: AC+VfDzA4Z+B8+bm7pXCEUoCkFI8klwomBdZ6uBozOS7d+1PzliVNO0N
	V2BejnGNBE98OI5kSqG72S6ouiOCoKE=
X-Google-Smtp-Source: ACHHUZ50qd4blUbaXDb7lEisXCYr+IljkCjGN3LmpsZoacfv64lAa7NJlhTCBBJH6KQKoqiX33IZCkEbDC4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:b497:b0:1a6:6c4e:4aa5 with SMTP id
 y23-20020a170902b49700b001a66c4e4aa5mr588890plr.11.1682608739881; Thu, 27 Apr
 2023 08:18:59 -0700 (PDT)
Date: Thu, 27 Apr 2023 08:18:58 -0700
In-Reply-To: <c99d6a6b-cb8b-c62d-7305-6b739a8c0671@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <ZEfrjtgGgm1lpadq@google.com> <DM8PR11MB575046B6DAA17B41FFED8080E7659@DM8PR11MB5750.namprd11.prod.outlook.com>
 <9fa5ce43-584d-878d-227a-fb458254c00a@amd.com> <ZElIjw7Ca6N2mYHe@google.com>
 <9021d861-cde6-a51a-7d8c-b3f67eaa01d8@amd.com> <ZEmBULXp24oMxaUH@google.com>
 <04383d21-b71e-93dd-5f4c-b39f5bc21937@amd.com> <ZEmYR0fWl05lGW0d@google.com>
 <DM8PR11MB57502652613A19C1A65D10BDE76A9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <c99d6a6b-cb8b-c62d-7305-6b739a8c0671@amd.com>
Message-ID: <ZEqSRTirPCxjy6M4@google.com>
Subject: Re: [PATCH] docs: security: Confidential computing intro and threat model
From: Sean Christopherson <seanjc@google.com>
To: Carlos Bilbao <carlos.bilbao@amd.com>
Cc: Elena Reshetova <elena.reshetova@intel.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
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
	"jejb@linux.ibm.com" <jejb@linux.ibm.com>, "cdupontd@redhat.com" <cdupontd@redhat.com>, 
	"jasowang@redhat.com" <jasowang@redhat.com>, "sameo@rivosinc.com" <sameo@rivosinc.com>, "bp@alien8.de" <bp@alien8.de>, 
	"security@kernel.org" <security@kernel.org>, Andrew Bresticker <abrestic@rivosinc.com>, 
	Rajnesh Kanwal <rkanwal@rivosinc.com>, Dylan Reid <dylan@rivosinc.com>, 
	Ravi Sahita <ravi@rivosinc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 27, 2023, Carlos Bilbao wrote:
> On 4/27/23 7:29 AM, Reshetova, Elena wrote:
> > I agree with Dave that I think the goal of this document is not to come=
 up with a
> > fancy name (I am fine with call it anything), but to introduce kernel d=
evelopers to the=20
> > new Linux threat model angle for this-particular-use-case-of-confidenti=
al-computing.
> > So that when we submit the hardening mechanisms in the future people ar=
e=20
> > already familiar with why we need to do this and we don=E2=80=99t have =
to repeat this story=20
> > again and again.=20
>=20
> Yes! To reiterate, there's two things we definitely wish to do:
>=20
> 1. Narrow down the problem: This new document can be specific to CoCo in
>    virtual environments. v2 should be clear about that.

Then rename the document as I already suggested.  If you want to claim
confidential-computing.rst, then IMO such a doc needs to be written somethi=
ng
like the surprisingly good Wikipedia article[*].  Until one of those two th=
ings
happens, my NAK stands.

[*] https://en.wikipedia.org/wiki/Confidential_computing
