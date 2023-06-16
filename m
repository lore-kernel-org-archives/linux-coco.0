Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA88A92E
	for <linux-coco@lists.linux.dev>; Fri, 16 Jun 2023 15:16:16 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-43f519c0888so323619137.3
        for <linux-coco@lists.linux.dev>; Fri, 16 Jun 2023 08:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686928575; x=1689520575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8jgJr8bM1lOUaw4QK6MEnF4AQ7yb4obHcHdbpD09yg=;
        b=cm8mpE/SEI+d8CQU8MF0enqqBDBatoOZY7DxCzE2f3qR6SJcai84l6zVgEfPSTyv4A
         t0Zt25wNfXq2UEp2uTTa4jyx9p4yIcDp4EjpibZ8+DRXD6Zi8Gq3YQa3436L0tb1fguQ
         YTe5kl4Ws9p4nOqTgmdmXoNsC1+ETplI9EzJA0Qe9g4qkJM1fGeFXU9xSdF6z25aIQbm
         UfiPb1mZOREMJsq+gA4ETzMvkM8KNhyOaFq33MLWy2SxRP0QWsVNjcaW0R0OTYw4ysaC
         r7oLHRc0irkMavIhwHG2fYCjZiVtbrVMMzZ9NqOqD1OlhtU78bXnM3+EZEIC8WA+BKLi
         w2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686928575; x=1689520575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8jgJr8bM1lOUaw4QK6MEnF4AQ7yb4obHcHdbpD09yg=;
        b=OCcwfg4wJNxk5HtXGCmhd8DxyuDio4UTeU/xa4QMCTOYE3V8LTiKP3+zB6olR67bnh
         Ws2Q6LPdizwR0E6+LKxzWoGevreYuw+7nuxaaDyK925vu0idDdzNjj9z+rxPp0+4wQSX
         R6r1p4cnarQDkIZn4qbFXdJcggI47hRk8oPL1JPTCPYUaLe937obSW4z/PoacH2BQG4E
         P8Jn1e4q07N4Hvm+p36lGTjzzam6B1cFfHusJZC9t2H37VMrKt72O5ynGsJN2SUlZybn
         PHlG3F4HOKQqYKWdDmrAdwnAug0DGGXRu/Pl28yUTfB89gH4jAOtWnPeB9BgVsuqySc5
         Q/jg==
X-Gm-Message-State: AC+VfDyr+2YYiZpsFl6ebOg9VkqSzEm71FWm/tTJApqadn0fkHB2IoiX
	LHhWcO1sm3sytjrAoi1MJJcDCVcwGKrKU6xWs10BZg==
X-Google-Smtp-Source: ACHHUZ4bLpJvlgGnRq8ZiYCA/Jg7q6mn37QlKu0LFH5+zNMOdVrjzxRrWMh6wp5AC15R+NyB7T3GuHaYFK7GmolQvlk=
X-Received: by 2002:a67:fb8c:0:b0:440:985e:73e0 with SMTP id
 n12-20020a67fb8c000000b00440985e73e0mr937046vsr.28.1686928575134; Fri, 16 Jun
 2023 08:16:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230612164727.3935657-1-carlos.bilbao@amd.com>
 <ZIihRqZljMaMRGcK@google.com> <DM8PR11MB5750D16B08B769173DCD740AE75AA@DM8PR11MB5750.namprd11.prod.outlook.com>
 <ZInLlkXsgnej9ZpT@google.com> <001aa2ed-2f78-4361-451d-e31a4d4abaa0@semihalf.com>
 <ZIxqAXhy1tCVpzz7@google.com> <CAJzde06TP5D1UAko6tJmdPt-0Ja4cnByWEDF0c6KJ4k__WjODg@mail.gmail.com>
 <ZIx0w/1x7HbmOKYr@google.com>
In-Reply-To: <ZIx0w/1x7HbmOKYr@google.com>
From: Allen Webb <allenwebb@google.com>
Date: Fri, 16 Jun 2023 10:16:03 -0500
Message-ID: <CAJzde04DSeVcMCVTN_3SFUVoKszL1YUbX9eHq6Y0QKtX16xCDA@mail.gmail.com>
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

On Fri, Jun 16, 2023 at 9:42=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Fri, Jun 16, 2023, Allen Webb wrote:
> > On Fri, Jun 16, 2023 at 8:56=E2=80=AFAM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > >
> > > On Fri, Jun 16, 2023, Dmytro Maluka wrote:
> > > > On 6/14/23 16:15, Sean Christopherson wrote:
> > > > > On Wed, Jun 14, 2023, Elena Reshetova wrote:
> > > > >>>> +This new type of adversary may be viewed as a more powerful t=
ype
> > > > >>>> +of external attacker, as it resides locally on the same physi=
cal machine
> > > > >>>> +-in contrast to a remote network attacker- and has control ov=
er the guest
> > > > >>>> +kernel communication with most of the HW::
> > > > >>>
> > > > >>> IIUC, this last statement doesn't hold true for the pKVM on x86=
 use case, which
> > > > >>> specifically aims to give a "guest" exclusive access to hardwar=
e resources.
> > > > >>
> > > > >> Does it hold for *all* HW resources? If yes, indeed this would m=
ake pKVM on
> > > > >> x86 considerably different.
> > > > >
> > > > > Heh, the original says "most", so it doesn't have to hold for all=
 hardware resources,
> > > > > just a simple majority.
> > > >
> > > > Again, pedantic mode on, I find it difficult to agree with the word=
ing
> > > > that the guest owns "most of" the HW resources it uses. It controls=
 the
> > > > data communication with its hardware device, but other resources (e=
.g.
> > > > CPU time, interrupts, timers, PCI config space, ACPI) are owned by =
the
> > > > host and virtualized by it for the guest.
> > >
> > > I wasn't saying that the guest owns most resources, I was saying that=
 the *untrusted*
> > > host does *not* own most resources that are exposed to the guest.  My=
 understanding
> > > is that everything in your list is owned by the trusted hypervisor in=
 the pKVM model.
> > >
> > > What I was pointing out is related to the above discussion about the =
guest needing
> > > access to hardware that is effectively owned by the untrusted host, e=
.g. network
> > > access.
> >
> > The network case isn't a great example because it is common for user
> > space applications not to trust the network and to use verification
> > schemes like TLS where trust of the network is not required, so the
> > trusted guest could use these strategies when needed.
>
> There's a bit of context/history that isn't captured here.  The network b=
eing
> untrusted isn't new/novel in the SNP/TDX threat model, what's new is that=
 the
> network *device* is untrusted.
>
> In the SNP/TDX world, the NIC is likely to be a synthetic, virtual device=
 that is
> provided by the untrusted VMM.  Pre-SNP/TDX, input from the device, i.e. =
the VMM,
> is trusted; the guest still needs to use e.g. TLS to secure network traff=
ic, but
> the device configuration and whatnot is fully trusted.  When the VMM is n=
o longer
> trusted, the device itself is no longer trusted.
>
> To address that, the folks working on SNP and TDX started posting patches=
[1][2]
> to harden kernel drivers against bad device configurations and whanot, bu=
t without
> first getting community buy-in on this new threat model, which led us her=
e[3].
>
> There is no equivalent in existing userspace applications, because usersp=
ace's
> memory is not private, i.e. the kernel doesn't need to do Iago attacks to=
 compromise
> userspace, the kernel can simply read whatever memory it wants.
>
> And for pKVM, my understanding is that devices and configuration informat=
ion that
> are exposed to the guest are trusted and/or verified in some way, i.e. th=
e points
> of contention that led to this doc don't necessarily apply to the pKVM us=
e case.

That extra context helps, so the hardening is on the side of the guest
kernel since the host kernel isn't trusted?

My biggest concerns would be around situations where devices have
memory access for things like DMA. In such cases the guest would need
to be protected from the devices so bounce buffers or some limited
shared memory might need to be set up to facilitate these devices
without breaking the goals of pKVM.

The minimum starting point for something like this would be a shared
memory region visible to both the guest and the host. Given that it
should be possible to build communication primitives on top, but yes
ideally something like vsock or virtio would just work without
introducing risk of exploitation and typically the hypervisor is
trusted. Maybe this could be modeled as sibling to sibling
virtio/vsock?

>
> [1] https://lore.kernel.org/linux-iommu/20210603004133.4079390-1-ak@linux=
.intel.com
> [2] https://lore.kernel.org/all/20230119170633.40944-1-alexander.shishkin=
@linux.intel.com
> [3] https://lore.kernel.org/lkml/DM8PR11MB57505481B2FE79C3D56C9201E7CE9@D=
M8PR11MB5750.namprd11.prod.outlook.com
