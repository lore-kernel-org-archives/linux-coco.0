Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B9E18C11
	for <linux-coco@lists.linux.dev>; Fri, 16 Jun 2023 14:10:02 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-43b3b30bd55so211981137.3
        for <linux-coco@lists.linux.dev>; Fri, 16 Jun 2023 07:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686924602; x=1689516602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UG/iG1PP3VNbKBwZi98yGZ3Q4NgI6Gz0Wj5eZD3quA=;
        b=4mz4fQHxunRllolc/a4/JUKfBDYsgE6Pk9GbP+mJbTRDox331R06d3oF+9cfnFBN1C
         YQlL92eq5vXzbvreNR89PsMAcy7JfnGhqs5iOlyTUy0mQ6ULdEC5xNMhTBzJStJeOBwh
         KmLL7Pa+3iNd7sdkonM2t5Ic3B5xCxkZsQB4HXPKarzYNwK+8M65yDYqvOI5LrWo9KNl
         KMjPjZMIVQwsaxkTnPh1tiLbg5SBlt8DuCRB0EZmjuZdyLPAAJt6eg9EA+SXgiuEK8CA
         u9BMt4rd3ZloTzh/C4N56QrFJdPaJvliwnB/a7EotYuOlFD5mueIRnKBg4zgzbyrCoxM
         +bDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686924602; x=1689516602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0UG/iG1PP3VNbKBwZi98yGZ3Q4NgI6Gz0Wj5eZD3quA=;
        b=YQ5Q0y3pOBJJDD9zzcguEqyj3uEDJoKfAm2xZSjjnuP85edomnB2j5eZhxkJnuXWAX
         hublg7bFtPkCxXwjgznC8QOjWcdklK/K1Kpjv9sUohcA+k2wvfkgW7/1hiFLUcUneey1
         /55H3n6yall2cnfpbWTP0rl2n1B9jT9GU4RqS5jHB+iRFeBAt32JqOhkeNtgGL3xL2h4
         ZoePFTrGuOtdbYRj7xnmM48XkDQ6DwFLWaCLLZTrqR32f2J544rqpA/U7dkSgq+6H+Wf
         SsuCYM1a+vxkw32NAuDdwkk+T1VHvg5OsznYFrIxIQ/cCF/cq17ru8kjB3y4MRDJ6GvH
         bg1Q==
X-Gm-Message-State: AC+VfDxIXozFDDk8swx1b0Z1EBxthDgJYg3MowiqSAgZFyBBdUbOf46e
	yREdPDlis43PFgHsrlyMY0zwk94MCCZ18f3VWcUwHQ==
X-Google-Smtp-Source: ACHHUZ4YeKHrxTY2/2Olc1L4hzuMRn/MfTdbY/qdTIZGERtkOW3HPCFKITqBbDBpQE0mIMl/r7/Yibv+qEWH9+xCU/c=
X-Received: by 2002:a67:e9d5:0:b0:440:9ab7:e2fb with SMTP id
 q21-20020a67e9d5000000b004409ab7e2fbmr406809vso.6.1686924601531; Fri, 16 Jun
 2023 07:10:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230612164727.3935657-1-carlos.bilbao@amd.com>
 <ZIihRqZljMaMRGcK@google.com> <DM8PR11MB5750D16B08B769173DCD740AE75AA@DM8PR11MB5750.namprd11.prod.outlook.com>
 <ZInLlkXsgnej9ZpT@google.com> <001aa2ed-2f78-4361-451d-e31a4d4abaa0@semihalf.com>
 <ZIxqAXhy1tCVpzz7@google.com>
In-Reply-To: <ZIxqAXhy1tCVpzz7@google.com>
From: Allen Webb <allenwebb@google.com>
Date: Fri, 16 Jun 2023 09:09:50 -0500
Message-ID: <CAJzde06TP5D1UAko6tJmdPt-0Ja4cnByWEDF0c6KJ4k__WjODg@mail.gmail.com>
Subject: Re: [PATCH v2] docs: security: Confidential computing intro and
 threat model for x86 virtualization
To: Sean Christopherson <seanjc@google.com>
Cc: Dmytro Maluka <dmy@semihalf.com>, Elena Reshetova <elena.reshetova@intel.com>, 
	Carlos Bilbao <carlos.bilbao@amd.com>, Jason CJ Chen <jason.cj.chen@intel.com>, 
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
	"jejb@linux.ibm.com" <jejb@linux.ibm.com>, "cdupontd@redhat.com" <cdupontd@redhat.com>, 
	"jasowang@redhat.com" <jasowang@redhat.com>, "sameo@rivosinc.com" <sameo@rivosinc.com>, "bp@alien8.de" <bp@alien8.de>, 
	"security@kernel.org" <security@kernel.org>, Larry Dewey <larry.dewey@amd.com>, android-kvm@google.com, 
	Dmitry Torokhov <dtor@google.com>, Tomasz Nowicki <tn@semihalf.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, 
	Patryk Duda <pdk@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2023 at 8:56=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Fri, Jun 16, 2023, Dmytro Maluka wrote:
> > On 6/14/23 16:15, Sean Christopherson wrote:
> > > On Wed, Jun 14, 2023, Elena Reshetova wrote:
> > >> Not having a network access requirement doesn=E2=80=99t implicitly i=
nvalidate the
> > >> separation guarantees between the host and guest, it just makes it e=
asier
> > >> since you have one interface less between the host and guest.
> > >
> > > My point is that if the protected guest doesn't need any I/O beyond t=
he hardware
> > > device that it accesses, then the threat model is different because m=
any of the
> > > new/novel attack surfaces that come with the TDX/SNP threat model don=
't exist.
> > > E.g. the hardening that people want to do for VirtIO drivers may not =
be at all
> > > relevant to pKVM.
>
> ...
>
> > But I think I get what you mean: there is no data transfer whereby the
> > host is not an endpoint but an intermediary between the guest and some
> > device. In simple words, things like virtio-net or virtio-blk are out o=
f
> > scope. Yes, I think that's correct for pKVM-on-x86 use cases (and I
> > suppose it is correct for pKVM-on-ARM use cases as well). I guess it
> > means that "guest data attacks" may not be relevant to pKVM, and perhap=
s
> > this makes its threat model substantially different from cloud use
> > cases.
>
> Yes.
>
> > >>>> +This new type of adversary may be viewed as a more powerful type
> > >>>> +of external attacker, as it resides locally on the same physical =
machine
> > >>>> +-in contrast to a remote network attacker- and has control over t=
he guest
> > >>>> +kernel communication with most of the HW::
> > >>>
> > >>> IIUC, this last statement doesn't hold true for the pKVM on x86 use=
 case, which
> > >>> specifically aims to give a "guest" exclusive access to hardware re=
sources.
> > >>
> > >> Does it hold for *all* HW resources? If yes, indeed this would make =
pKVM on
> > >> x86 considerably different.
> > >
> > > Heh, the original says "most", so it doesn't have to hold for all har=
dware resources,
> > > just a simple majority.
> >
> > Again, pedantic mode on, I find it difficult to agree with the wording
> > that the guest owns "most of" the HW resources it uses. It controls the
> > data communication with its hardware device, but other resources (e.g.
> > CPU time, interrupts, timers, PCI config space, ACPI) are owned by the
> > host and virtualized by it for the guest.
>
> I wasn't saying that the guest owns most resources, I was saying that the=
 *untrusted*
> host does *not* own most resources that are exposed to the guest.  My und=
erstanding
> is that everything in your list is owned by the trusted hypervisor in the=
 pKVM model.
>
> What I was pointing out is related to the above discussion about the gues=
t needing
> access to hardware that is effectively owned by the untrusted host, e.g. =
network
> access.

The network case isn't a great example because it is common for user
space applications not to trust the network and to use verification
schemes like TLS where trust of the network is not required, so the
trusted guest could use these strategies when needed. There wouldn't
be any availability guarantees, but my understanding is that isn't in
scope for pKVM.

In the case where the host owns a TPM and the guest has to cooperate
with the host to communicate with the TPM. There are schemes for
establishing trust between the TPM and the trusted guest with various
properties (authentication, confidentiality, integrity, etc.). This
does have the downside of additional complexity, but comes with the
benefit of also being resistant to attacks like monitoring the SPI
lines going to the TPM.

Did you have particular situations in mind for resources that would be
owned by the host and needed by the trusted guest?
