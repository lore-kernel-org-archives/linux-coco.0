Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC713C2CB
	for <linux-coco@lists.linux.dev>; Thu, 27 Apr 2023 18:47:20 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4ecb7fe8fb8so14488e87.0
        for <linux-coco@lists.linux.dev>; Thu, 27 Apr 2023 11:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682621239; x=1685213239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wip6JELstgrRrpm5rCuzpjQkrpjo14HwVjyh7pTJ+vU=;
        b=O9k7tDF9Y3pUKc/7NYlOGrwEzrRFMQ4BaLQtEBtZPgzEo8b9WoXyteDbur9yze8Yvh
         fPIz7+JuXbsV5V6y3xia++F937NdIu4ykVRZBNgi/wJ0TMLhfOPjkO3k+BnhF1+aqdo3
         qe4p21gu2WdBK16R1usVXjF1gVfxwYzk+kDEE5m7q7FF09DxSxVi2X7cMQ7rmPJlW+3u
         09DkFKuvWCh9K4ZLM0GEh1E+d7m1Xfv+vaPxUJflZO56pZd4rnM0Z8R2NK2IJBTIdp/7
         iueJhsPKCtCCntQa7k90KmDqVlFDTIrP4CslTzwccR3UOcgJ4JJ6iG/B5SHtVYa5jJrS
         ojCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682621239; x=1685213239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wip6JELstgrRrpm5rCuzpjQkrpjo14HwVjyh7pTJ+vU=;
        b=LhAHlWriR8NI9d79s7IbPYPWo2gFWo7JZvGKhJmj8lwocPm8wPR5iVNj8A7GhjwNra
         Kt7CT/pITLVXr1LVM9mx3U2irswQdGLL2GDGraOqWZaE+XfS+erXy6HaZh741xnDyaWt
         aP11rVeY57tvxJrduOCNJAoRkfCOK6VVf5PvmL6gYmm1bCTIJolD1Gutn1j0+2V129N0
         7WhQx9CDR65XURm6Jl/PEPcS2ToocXk+SCnfXKucZ0c7Pxcd+S1rz3YkwHt/lHSM8m6/
         Vmv6rIoxij8GFyJz372Yvh/6XdMrPrXn3CpwJRoJTCwIe5BOKRRegdlrP5B+rLk0RHCY
         ka5w==
X-Gm-Message-State: AC+VfDyd4aB4vzF4WVnYjDBT57pgeSvfLyEe3zjmPBLMpThRGu3k2Kos
	LTFhLMT4HU3khAF6veP078Tj/hGUefxYwJnKBoz+MQ==
X-Google-Smtp-Source: ACHHUZ7mDTKk9IEa4gpcVK2FT9eyYyaSsg6RFbKE6nat44jZDnlq3L9rw5ZeAmNqI1z9D3uMpuWicwY76KcinJoxqCc=
X-Received: by 2002:a05:6512:b83:b0:4ed:3ca3:9856 with SMTP id
 b3-20020a0565120b8300b004ed3ca39856mr14699lfv.3.1682621238615; Thu, 27 Apr
 2023 11:47:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230327141816.2648615-1-carlos.bilbao@amd.com> <ZEfrjtgGgm1lpadq@google.com>
In-Reply-To: <ZEfrjtgGgm1lpadq@google.com>
From: Peter Gonda <pgonda@google.com>
Date: Thu, 27 Apr 2023 12:47:06 -0600
Message-ID: <CAMkAt6ohvgj6h=jySx0684MiF7GZt_Q7AZK5uyU2PRKomg=rgw@mail.gmail.com>
Subject: Re: [PATCH] docs: security: Confidential computing intro and threat model
To: Sean Christopherson <seanjc@google.com>
Cc: Carlos Bilbao <carlos.bilbao@amd.com>, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ardb@kernel.org, kraxel@redhat.com, 
	dovmurik@linux.ibm.com, elena.reshetova@intel.com, 
	dave.hansen@linux.intel.com, Dhaval.Giani@amd.com, michael.day@amd.com, 
	pavankumar.paluri@amd.com, David.Kaplan@amd.com, Reshma.Lal@amd.com, 
	Jeremy.Powell@amd.com, sathyanarayanan.kuppuswamy@linux.intel.com, 
	alexander.shishkin@linux.intel.com, thomas.lendacky@amd.com, 
	tglx@linutronix.de, dgilbert@redhat.com, gregkh@linuxfoundation.org, 
	dinechin@redhat.com, linux-coco@lists.linux.dev, berrange@redhat.com, 
	mst@redhat.com, tytso@mit.edu, jikos@kernel.org, joro@8bytes.org, 
	leon@kernel.org, richard.weinberger@gmail.com, lukas@wunner.de, 
	jejb@linux.ibm.com, cdupontd@redhat.com, jasowang@redhat.com, 
	sameo@rivosinc.com, bp@alien8.de, security@kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> > +understanding of the subject.
> > +
> > +Overview and terminology
> > +========================
> > +
> > +Confidential Cloud Computing (CoCo) refers to a set of HW and SW
>
> As per Documentation/security/secrets/coco.rst and every discussion I've observed,
> CoCo is Confidential Computing.  "Cloud" is not part of the definition.  That's
> true even if this discussion is restricted to CoCo VMs, e.g. see pKVM.
>
> > +virtualization technologies that allow Cloud Service Providers (CSPs) to
>
> Again, CoCo isn't just for cloud use cases.

Agreed Cloud should not be included in the definition. pKVM may be
considered CoCo and its current usage is protecting secrets on a
single device. CoCo features could be used with-in a single
organization to add extra protection to high value secrets.

>
> > +provide stronger security guarantees to their clients (usually referred to
> > +as tenants) by excluding all the CSP's infrastructure and SW out of the
> > +tenant's Trusted Computing Base (TCB).
>
> This is inaccurate, the provider may still have software and/or hardware in the TCB.
>
> And for the cloud use case, I very, very strongly object to implying that the goal
> of CoCo is to exclude the CSP from the TCB.  Getting out of the TCB is the goal for
> _some_ CSPs, but it is not a fundamental tenant of CoCo.  This viewpoint is heavily
> tainted by Intel's and AMD's current offerings, which effectively disallow third
> party code for reasons that have nothing to do with security.
>
> https://lore.kernel.org/all/Y+aP8rHr6H3LIf%2Fc@google.com
>

How about phrasing like "CoCo allows its users to pick and choose
which pieces of software system to trust and gives the ability to
attest the state of trusted components"

Maybe some customers want to exclude or attest to the entire CSP infra
and SW. But it seems likely that customers may want to use and trust
some components of a CSP. For instance you may enable CoCo on a
workload but then trust the CSP's IAM implementation to make sure data
only enters those CoCo workloads.

>
> > +Confidential Computing threat model and security objectives
> > +===========================================================
> > +
> > +Confidential Cloud Computing adds a new type of attacker to the above list:
> > +an untrusted and potentially malicious host.
>
> I object to splattering "malicious host" everywhere.  Many people are going to
> read this and interpret "host" as "the CSP", and then make assumptions like
> "CoCo assumes the CSP is malicious!".  AIUI, the vast majority of use cases aren't
> concerned so much about "the CSP" being malicious, but rather they're concerned
> about new attack vectors that come with running code/VMs on a stack that is
> managed by a third party, on hardware that doesn't reside in a secured facility,
> etc.
>
> > +While the traditional hypervisor has unlimited access to guest data and
> > +can leverage this access to attack the guest, the CoCo systems mitigate
> > +such attacks by adding security features like guest data confidentiality
> > +and integrity protection. This threat model assumes that those features
> > +are available and intact.
>
> Again, if you're claiming integrity is a key tenant, then SEV and SEV-ES can't be
> considered CoCo.

Hmm the doc mentions "untrusted and potentially malicious host." but
seems to take the stance the CoCo requires tech where malicious host
deprivelleging is possible. But as Sean points out there may be valid
CoCo theat models where the host is trusted, or trusted to be benign
like SEV and SEV-ES.

I think this doc could use some more nuance so that less strict
threat-models are supported.

Also in regard to "malicious host" I think we can use this term since
that could be a valid threat. And in general I think cloud customers
are sophisticated enough to understand that a single lone malicious
host is far different than a malicious CSP. CSPs are in general large
organizations with many services of which VMs or "enclaves" are only a
small part.
