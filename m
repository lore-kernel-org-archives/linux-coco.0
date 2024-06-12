Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EDE84FDF
	for <linux-coco@lists.linux.dev>; Wed, 12 Jun 2024 21:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718227107; cv=none; b=KjvR9+BRUXzHh7BU1jbf6uxw7HCnxwuMsvqRyGfWtB5GlCM8cgzlTLe3gbVadeL1NHjBMNYEtuQYKWTFaBF8Gffvu4DMzNYIz8VM4DNf9ahtFxnQG8W3zhphvmnJY1iECmi9SYYOERj5IbGRB6ob64igSLvjluQMSCquX+jVUlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718227107; c=relaxed/simple;
	bh=HmkPVMGgXG6hyl19z2yCgSyNpeN02sOFmJSM61ysUGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hs/nWbcBG3lqaPY0SWaMw8ffB9WBc2TOV79ozh3TX6yXNdC2UJ/K8CxlnlV+MyF+UKu9Kae6yAxsMmsaujb4MpAn23PG1FAk3VjsamBfd+JocMecRcLMxbt/DEkBlQL9lKlttQGG4NfVSpnEKrOzzoBqJMimFEljZEWElWGxVyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5430ds1; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5430ds1"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dfa8394d3f4so41229276.2
        for <linux-coco@lists.linux.dev>; Wed, 12 Jun 2024 14:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718227104; x=1718831904; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BEOwZmnGSndBKUoCTfCdkAvbTohzwX+ks2aejKL3XsI=;
        b=i5430ds16cbnDit//qnoF1kLsHL9SMTirvxwd9l7UWJ17Z+eySkhL+66jpoN6XgxSN
         kz3E+U17YwOTPz8fLP4ewCziu0AwBDWRpRy4LWJcGYh+Y7jTblTOIBQvg3+Jyorx+nYa
         BXkI5wgZ6FvNS8o4i4uHDQeAw/cad6jhMgHNnawroealH5NjFrgxl1MK1KrfafE2Y2G/
         BLxTWlmVB/d0Er0YmtOZ3aEvyCjI3izyFHDBABNrnKVhpvNq2Hm/UftQo5XdFue8TQHn
         y6mgJ/Z/FJvEXQc6fQXgsySD5IzfkRnTxsjn+0VVZLf+GCdG2RkwmLGGFo9RE/Fy+q3b
         0itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718227104; x=1718831904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEOwZmnGSndBKUoCTfCdkAvbTohzwX+ks2aejKL3XsI=;
        b=TyuNAeVa2Rws9p+uZ/l1nhdsSTGknq9Z+qC6X420O5A3JyzUwYqSFtGYDd1Cq+M4GF
         ti9X1/2qWCpSFN3pIUl/BWxpIAp91VLaQCe7Q60Ea1IV0dX/p+0O09pXCwq5n3FibABC
         OsMSR7myKoJliR92IO6MuV+DNqpzEApjRWLT6ivg4kSFSOrOseyHA6w3vIz+ftoQKcy4
         ej+5NS4Cayc9wlwKDqLWKobxgB9ZwllSd54EUf+l9GnBKhmn6TLX2uPvGB/l6y5kbwur
         C2ypPGAaqwUk8pPaFC8s88D4u1SE0epZjzHTSl1NF9JYdeCwtZl4Dz664jnsQFjMXvOG
         1EWw==
X-Forwarded-Encrypted: i=1; AJvYcCVd3AUg58JSmf0pxv00azGdZHnc1+3tRTZ33N7iu+YgULnA0YbmOiEgQWPM0Buu+TV3pj9f3GsXVS6Z/J85YHx2/8oBzYAszw1cpg==
X-Gm-Message-State: AOJu0YyWUdFZTTH7HC3Ld7FKhEc5KxZPu1wXCbbvKUAf7syqjDWGbwAH
	m0xeOyGaEBRfjbr4o5SuebUvHRzLj00u/0/06KadPzjYMWApg+MsqxcFUVmzUFM2/W5WZfSpDu1
	xY+W/HMTtISbETgpU7MSuCJwS+eCWkg==
X-Google-Smtp-Source: AGHT+IEaB+lXJVXf+Xg8CikGCvv6MHGxJKVsSv1q0X5TWQR34W9FLcMvfJIvaJUi846myfmELPisGPmvN4B0oTjWgUI=
X-Received: by 2002:a25:dc90:0:b0:df7:737e:9d87 with SMTP id
 3f1490d57ef6-dfe6b184ac2mr2888218276.6.1718227104477; Wed, 12 Jun 2024
 14:18:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <61b65115-5945-4e27-89e4-bb6cba657f7f@linux.intel.com>
 <0ebfe6b4-ee5d-4909-8a3b-bbc1bd7623c7@amazon.com> <DM8PR11MB5750ECCF396D756D40BABF42E7FB2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <c3457141-1b62-4a7b-9cba-0ecec4dfb693@amazon.com> <DM8PR11MB5750B08CA4CBFD459268A42CE7C02@DM8PR11MB5750.namprd11.prod.outlook.com>
 <98756bac-8de3-4eeb-97b2-9fa0bcf869ff@amazon.com> <DM8PR11MB5750FB4A0C87D13CACB11D5AE7C02@DM8PR11MB5750.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB5750FB4A0C87D13CACB11D5AE7C02@DM8PR11MB5750.namprd11.prod.outlook.com>
From: Steve Rutherford <ruthafjord@gmail.com>
Date: Wed, 12 Jun 2024 14:18:13 -0700
Message-ID: <CAN=80Bv1Vvskvty8SW1Fh=99iMzhFZDFOhD9-2K-+P57f1NnyA@mail.gmail.com>
Subject: Re: Confidential Computing call May 10: RTMR ABI & TEE I/O
To: "Reshetova, Elena" <elena.reshetova@intel.com>
Cc: "Graf, Alexander" <graf@amazon.com>, Dan Middleton <dan.middleton@linux.intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Kalra, Ashish" <ashish.kalra@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 6:19=E2=80=AFAM Reshetova, Elena
<elena.reshetova@intel.com> wrote:
>
>
> > Hi Elena,
> >
> > On 12.06.24 13:19, Reshetova, Elena wrote:
> > >> On 07.06.24 16:46, Reshetova, Elena wrote:
> > >>>> Hi Dan,
> > >>>>
> > >>>> On 03.05.24 21:55, Dan Middleton wrote:
> > >>>>> Hi
> > >>>>> Next Friday, May 10th at 9am PDT, we have a Confidential Computin=
g
> > >>>>> devsec / BoF / Discussion Group / SIG call. Everyone is welcome.
> > >>>>>
> > >>>>> Tentative agenda includes RTMR ABI v3 direction and TEE I/O next =
steps.
> > >>>> I haven't seen an email for today's call, so let me throw my topic
> > >>>> suggestion here:
> > >>>>
> > >>>> I would like to talk about "confidential kexec" today: A kexec mec=
hanism
> > >>>> that allows you to destroy the confidential VM you're in and recre=
ate a
> > >>>> new one based on a payload of the old one. With that, we would hav=
e a
> > >>>> very easy and clean mechanism to bootstrap a VM into a fully measu=
red
> > >>>> new execution stack.
> > >>> Interesting topic, I am curious of the requirements!
> > >>> Sounds like you want a local fast migration, i.e. a migration to a =
new
> > >>> CoCo VM on the same platform? I guess the difference would be the a=
bsence
> > >>> of the online migration phase since you are probably ok stopping th=
e
> > >>> original CoCo VM first.
> > >>
> > >> Almost. I basically want the VM to be able to provide a new early
> > >> measurement. So the opposite of migration: With migration, I want to
> > >> preserve previous state. Here, the main motivation is to get rid of =
any
> > >> previous state except the new "seed" for the target VM.
> > >>
> > >> There are 2 main use cases for this:
> > >>
> > >> 1) Measurement purely based on initial launch measurements. If the f=
ull
> > >> OS is inside an initramfs, we can provide firmware+kernel+initramfs =
as
> > >> "seed". The CoCo env would measure everything and I have an easy pat=
h to
> > >> validate authenticity of my target environment. I also have an easy =
path
> > >> to update the VM and then measure without replaying any event logs.
> > >>
> > >> 2) Update SVSM (or similar). Often today, you want to implement TPMs=
 and
> > >> inside a higher privileged component that is really part of the VM. =
To
> > >> update it, you could use in-VM mechanisms, but that leaves a path wh=
ere
> > >> you boot with an old version -> exploit -> update to the new. If we
> > >> could "reboot"/kexec into a new SVSM, we could reason about its
> > >> confidentiality with a 100% guarantee.
> > > I think I am still confused on the problem statement. You are saying =
that
> > > CoCo customers should be able to update their coco VMs (with SVSM or
> > without)
> > > without CSP intervention, which fully makes sense. But at the same ti=
me
> > > you want to do it without a coco VM reboot (which is the easiest way =
of
> > > solving this with existing means), but via some kind of fast runtime =
kexec
> > > of the whole machine? Why? If customer is updating its coco VM, it sh=
ould
> > > be ok for them to save data and take a full reboot, why not?
> > > I do agree that there is another problem currently with the fact how =
hard
> > > it is to reason about the state of the full SW stack of CoCo VM (many
> > > measurements, many updated components, long event log, things that
> > > might not get measured, etc.), but it seems a different problem to th=
e
> > > one you are stating or?
> >
> >
> > I *want* a full coco VM reboot. But I also want the pre-reboot VM to
> > provide the initial launch data for the post-reboot VM.
> >
> > The typical reboot case (CoCo or not) is that a VM always starts with
> > initial launch data that the VM provider provisions. That means again
> > the "typical" path is that you boot with initial launch data that your
> > VM provider dictates: Either explicitly (like in EC2, where we give you
> > a publicly, reproducibly built OVMF binary) or implicitly through a
> > selection of "known good launch data" you can choose from.
> >
> > You can in theory even set up side channels from the customer to your
> > provider to upload new "known good launch data". But that's complicated
> > for all layers because it requires API privileges the VM may not
> > otherwise require and it means you need to store and transfer that data
> > across the control plane of the target launch stack.
> >
> > My proposal above was to do a reboot, but instead of seeding the
> > "initial launch data" from the provider, you just seed it from the
> > pre-reboot environment. That way customers can reboot into any version
> > of code they like and 100% own their measurements in a VM provider
> > agnostic way.
> >
> > Kexec comes into play because from a customer experience, the flow
> > should ideally be as easy as saying "kexec me into this new firmware". =
I
> > say kexec here because it's the closest analogy we have in Linux to
> > "reboot, but with a pre-reboot provided payload". The fact that kexec
> > doesn't perform a reboot today but simulates it using fancy stunts is a=
n
> > implementation detail IMHO.
>
>
> Thank you for clarifying this! I think I got too much into thinking of ke=
xec
> runtime update. I think this came from you originally saying that you wan=
t
> to preserve the *payload of the original VM* in:
>
> " I would like to talk about "confidential kexec" today: A kexec mechanis=
m
> that allows you to destroy the confidential VM you're in and recreate a
> new one based on a payload of the old one "
>
> And by VM payload I thought of some state in memory.
>
> But you just want to provide a way
> for customer to supply the CoCo VM SW components (somehow, tbd details)
> and have a way for customer to ask to reboot into this content. The actua=
l
> customer data is still comes from protected disk and the full attestation
> process must be done for this new VM (with customer somehow
> updating the new target measurement for VM in respected KBS)
>  before it can get access to this disk.
>
> But still one question: why does this mechanism has to be from *within* t=
he
> CoCo VM itself? Is it in order not to design CSP-specific mechanism for
> doing it via some CSP-provided web interface?

I have the same question. This design feels like a way to side step
adding API surface by instead adding an even more inflexible kernel
ABI surface. And, on top of that, requiring an extra reboot in order
to initialize a CC VM. Why not skip that step and just initialize the
VM to the "correct" state in the first place? Interfaces like this
seem most appropriate at the CSP API level.

It also leaves me with latent questions about firmware, since this
seems to imply customer controlled firmware. Not totally sure this is
inherently problematic, but it's not something I'm excited to maintain
compatibility with.

Thanks,
--Steve


>
> But I do like the idea in principle, we can indeed currently change only =
guest
> kernel via kexec, but we dont have a way to do the same for virtual FW
> and other potential components included in CoCo VM at least generically.
>
> Best Regards,
> Elena.
>
>
> >
> >
> >
> >
> > Amazon Web Services Development Center Germany GmbH
> > Krausenstr. 38
> > 10117 Berlin
> > Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
> > Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
> > Sitz: Berlin
> > Ust-ID: DE 365 538 597
