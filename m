Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934861DA3A
	for <linux-coco@lists.linux.dev>; Fri,  8 Mar 2024 23:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709940174; cv=none; b=qywYLkfWERLUDV2AyvigruHC8nTnbOLfwb0LyFfRw8HXCBgnOyCAK5crvFQniVq/48PTdOHe3JIWzjGG/Jz7V7FQvv7ZovIr0y5zno4cv8S3S7y/ywLezOSRbjU76okOxNHfdDbJadgirX02aoDkIpXDwFaPH4oMy1ukfj/yXvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709940174; c=relaxed/simple;
	bh=LcAL4HJapLzwRprK5FA6YW0O8VXdIWha6BN3NRhxhhg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qBHauJBz6KVAX30YVed9uhPLrNM03MggSYXaFciXkAl55nHx+utDGy16pd/48tyKFlWtdBEaO0fTBR9aBbtagZND/9q+fIHqpDkmLmQxo0m1z8QF/3THeFFA6Wske3p+afxCLXBVVN9cv2lLlwv5U6Obvy8tTdvemsQTW1FDTnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cz9/onxo; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cz9/onxo"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-60a0815e3f9so15341467b3.2
        for <linux-coco@lists.linux.dev>; Fri, 08 Mar 2024 15:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709940171; x=1710544971; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7S3B1t8pdIqU5Wjnk50i6MWuw2joVUe0pWEUYZUDmO4=;
        b=Cz9/onxoQQ7wdkFwz/Kl+wR9MGynaFp3RIAXi9kBHlkRMG9tN6UnV+qker44B6HZFY
         ohjOGaLHq8FP+rA57EZpsoGEDq6Q6DGpGk0LvOa4VrFjQYa8AHvkD6w4a0LzqO0VUDAe
         NVXjK4oJymQxCkTx+zNq7SL50zSJw7AZA+TSWnR7AAlLfOOS6IWSifJTfLyPdPlsH/HH
         VYw7sGCzu8eAluk6qJNtpOh+sGPw6nLWpXN6UYE+4h+wfhjkbvRr4543MNWsoGhGkM2k
         S1+FjpL/9gHSwQbtfoYMSIWfzN4VEX55JQEkTSIr1SYUugCJjomut2Fkd+zsDVhGtiDi
         uvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709940171; x=1710544971;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7S3B1t8pdIqU5Wjnk50i6MWuw2joVUe0pWEUYZUDmO4=;
        b=FIhGFAp48b9MmfDY5TvUSGGoMfzwxFbL/+sw5aLuxKsVAijesi/0Bi9REP3s/GP8Tq
         soV4hRepiLl3QkIYse6o5f/g++6w6t0lLyEP2H/Uif36IZEIX8uqgRKV7BfQORrIBvxx
         rLSP2jOBWHuoBCQTDyMzKg+4ChbTNmxNwTNIeEuy8OwZsG3QKPeMq/djCz6ofpMgDesD
         68YGigd539r/+aMP2kKgindiO1F6JcWV1LUoFP/4mYZhrrMJGKqUmCxjHgCLH8BiFI9G
         c4rA8EoWu49KNcMNqcYQab6iS1k8TNShnFfMjYP+b1Zq3hlSLylYWLLoPUZIrHkqrByV
         4sMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR9OXTFAJQ+YJaniwLvGEWNt8uDnPuKNCBTTUIYj9SBotOjT0IiEjzODphjDBXR+w7S+f7VmdOUty/TqiZPz0bm7hoMSZTxXCRHw==
X-Gm-Message-State: AOJu0YwnVOAo0OoREsJcY51El7IZePlSJKS1LFJ4U6XP+1jYLDGuY973
	GPSLWD2BQj2k6MosfvE/yWAnA+iDwJaczy4S7DAJt+vhoafl6avG834BxquB5lnExLWCW5hai9j
	CAw==
X-Google-Smtp-Source: AGHT+IHIif5Eml2ZF3fDerW6drNpqFldJ7Jz2SKMgJzKuurv4zQCJLfYI0vd1IGQU3mKE9h27C6nTWKouOk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:d7d3:0:b0:608:e67f:4387 with SMTP id
 z202-20020a0dd7d3000000b00608e67f4387mr134113ywd.7.1709940171728; Fri, 08 Mar
 2024 15:22:51 -0800 (PST)
Date: Fri, 8 Mar 2024 15:22:50 -0800
In-Reply-To: <cc1bb8e9bc3e1ab637700a4d3defeec95b55060a.camel@amazon.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cc1bb8e9bc3e1ab637700a4d3defeec95b55060a.camel@amazon.com>
Message-ID: <ZeudRmZz7M6fWPVM@google.com>
Subject: Re: Unmapping KVM Guest Memory from Host Kernel
From: Sean Christopherson <seanjc@google.com>
To: James Gowans <jgowans@amazon.com>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>, Patrick Roy <roypat@amazon.co.uk>, 
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, Derek Manwaring <derekmn@amazon.com>, 
	"rppt@kernel.org" <rppt@kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, Nikita Kalyazin <kalyazin@amazon.co.uk>, 
	"lstoakes@gmail.com" <lstoakes@gmail.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"mst@redhat.com" <mst@redhat.com>, "somlo@cmu.edu" <somlo@cmu.edu>, Alexander Graf <graf@amazon.de>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 08, 2024, James Gowans wrote:
> However, memfd_secret doesn=E2=80=99t work out the box for KVM guest memo=
ry; the
> main reason seems to be that the GUP path is intentionally disabled for
> memfd_secret, so if we use a memfd_secret backed VMA for a memslot then
> KVM is not able to fault the memory in. If it=E2=80=99s been pre-faulted =
in by
> userspace then it seems to work.

Huh, that _shouldn't_ work.  The folio_is_secretmem() in gup_pte_range() is
supposed to prevent the "fast gup" path from getting secretmem pages.

Is this on an upstream kernel?  If so, and if you have bandwidth, can you f=
igure
out why that isn't working?  At the very least, I suspect the memfd_secret
maintainers would be very interested to know that it's possible to fast gup
secretmem.

> There are a few other issues around when KVM accesses the guest memory.
> For example the KVM PV clock code goes directly to the PFN via the
> pfncache, and that also breaks if the PFN is not in the direct map, so
> we=E2=80=99d need to change that sort of thing, perhaps going via userspa=
ce
> addresses.
>=20
> If we remove the memfd_secret check from the GUP path, and disable KVM=E2=
=80=99s
> pvclock from userspace via KVM_CPUID_FEATURES, we are able to boot a
> simple Linux initrd using a Firecracker VMM modified to use
> memfd_secret.
>=20
> We are also aware of ongoing work on guest_memfd. The current
> implementation unmaps guest memory from VMM address space, but leaves it
> in the kernel=E2=80=99s direct map. We=E2=80=99re not looking at unmappin=
g from VMM
> userspace yet; we still need guest RAM there for PV drivers like virtio
> to continue to work. So KVM=E2=80=99s gmem doesn=E2=80=99t seem like the =
right solution?

We (and by "we", I really mean the pKVM folks) are also working on allowing
userspace to mmap() guest_memfd[*].  pKVM aside, the long term vision I hav=
e for
guest_memfd is to be able to use it for non-CoCo VMs, precisely for the sec=
urity
and robustness benefits it can bring.

What I am hoping to do with guest_memfd is get userspace to only map memory=
 it
needs, e.g. for emulated/synthetic devices, on-demand.  I.e. to get to a st=
ate
where guest memory is mapped only when it needs to be.  More below.

> With this in mind, what=E2=80=99s the best way to solve getting guest RAM=
 out of
> the direct map? Is memfd_secret integration with KVM the way to go, or
> should we build a solution on top of guest_memfd, for example via some
> flag that causes it to leave memory in the host userspace=E2=80=99s page =
tables,
> but removes it from the direct map?=20

100% enhance guest_memfd.  If you're willing to wait long enough, pKVM migh=
t even
do all the work for you. :-)

The killer feature of guest_memfd is that it allows the guest mappings to b=
e a
superset of the host userspace mappings.  Most obviously, it allows mapping=
 memory
into the guest without mapping first mapping the memory into the userspace =
page
tables.  More subtly, it also makes it easier (in theory) to do things like=
 map
the memory with 1GiB hugepages for the guest, but selectively map at 4KiB g=
ranularity
in the host.  Or map memory as RWX in the guest, but RO in the host (I don'=
t have
a concrete use case for this, just pointing out it'll be trivial to do once
guest_memfd supports mmap()).

Every attempt to allow mapping VMA-based memory into a guest without it bei=
ng
accessible by host userspace emory failed; it's literally why we ended up
implementing guest_memfd.  We could teach KVM to do the same with memfd_sec=
ret,
but we'd just end up re-implementing guest_memfd.

memfd_secret obviously gets you a PoC much faster, but in the long term I'm=
 quite
sure you'll be fighting memfd_secret all the way.  E.g. it's not dumpable, =
it
deliberately allocates at 4KiB granularity (though I suspect the bug you fo=
und
means that it can be inadvertantly mapped with 2MiB hugepages), it has no l=
ine
of sight to taking userspace out of the equation, etc.

With guest_memfd on the other hand, everyone contributing to and maintainin=
g it
has goals that are *very* closely aligned with what you want to do.

[*] https://lore.kernel.org/all/20240222161047.402609-1-tabba@google.com
