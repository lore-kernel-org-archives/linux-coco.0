Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD8B7B
	for <linux-coco@lists.linux.dev>; Tue, 25 Apr 2023 08:00:19 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4ec816d64afso23373010e87.1
        for <linux-coco@lists.linux.dev>; Tue, 25 Apr 2023 01:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682409618; x=1685001618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJcVKVJA3HgnW7bSvVOddaHKG/ERA+dvV0Lub2llU+Q=;
        b=EOkcITT5Rq6XWK3ejRIWqvQTkMe0ymO3UjoLJxHU/nMXd+kJfjuDnngRLl0056SRHm
         ThA9qKaCSDNobvcy6jnV68/ursuWUy1LRvfcOiMnvJd6umM5gBHUqjEii9P0KObi7KGh
         BAFvn/jnFZdpnznd05oLdmPYj0b3vIN6GQEhpBNTdSfL4z+ZwxB1QMA9d150A+77EI3i
         plazI1uNEF7MssMeARqn6HbaKObj7K0qUBZHDm45tsXJspZswccglcpyVh33k/az8cYf
         7sxktCdB7+YpplssXVz1+FDrVlx5NHqwNlTaeiZQzIojqvTIoBPoyIpW8YSps41cN/xv
         Ujqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682409618; x=1685001618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJcVKVJA3HgnW7bSvVOddaHKG/ERA+dvV0Lub2llU+Q=;
        b=PrwRjNBBm8/oJ5J+x47EwaSEdoktrqsdQMGQkw6xaSGSdNBaPlU24D7yS1FzX/GRnJ
         bwYguKHmSE8v8u1iGS9rvbv9SJ0Tf22sS7QZBNHyjFY49ZT79UwxFeKMUbOb8BqFk+42
         0L9BJgqZqf98aR6+H2u/+6AXuZSBVERqpif5QCOheHOLHZHGp41qT2pN3556yZp9EkvJ
         hTQHz4EEA4dSzx1MVuHVtz7mWAjO7ABtXsVoxukAS33ip+PK0IEfHBM13kV/6NsN5k3F
         bkNS2VJ74FbWX7PyiGDEzbU/P8gV6SeQbxqeeuVUnA/Vd083NDxaU29EnNQh4l9IKFtu
         96Dw==
X-Gm-Message-State: AAQBX9eFhI/vXB3GoTGPmaH4P1qR+G6JDwdvh4HPMvQj1qMAAH62T+ut
	B3duuPPC1pMpazc6IXPv6Xsp5KBcfGk8Epd31hRbzA==
X-Google-Smtp-Source: AKy350ZxdfhaQD3I1+8v331wKiSztM8EPfAn2hc331pKYjbFsrskYvBdyUu9x9mXAh7RJVZWCXfYiGyWTG2NjZzD97c=
X-Received: by 2002:a2e:9b87:0:b0:2aa:4550:9169 with SMTP id
 z7-20020a2e9b87000000b002aa45509169mr3099317lji.20.1682409617717; Tue, 25 Apr
 2023 01:00:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230419221716.3603068-1-atishp@rivosinc.com> <20230419221716.3603068-46-atishp@rivosinc.com>
 <69ba1760-a079-fd8f-b079-fcb01e3eedec@intel.com> <CAHBxVyFhDapAeMQ8quBqWZ10jWSHw1CdE227ciyKQpULHYzffA@mail.gmail.com>
 <81c476f4-ef62-e4a6-0033-8a46a15379fd@intel.com>
In-Reply-To: <81c476f4-ef62-e4a6-0033-8a46a15379fd@intel.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 25 Apr 2023 13:30:06 +0530
Message-ID: <CAHBxVyHg7vTaQJWKoVSD8budVZEYSo1eDOyZyZK7gcJApR7SbA@mail.gmail.com>
Subject: Re: [RFC 45/48] RISC-V: ioremap: Implement for arch specific ioremap hooks
To: Dave Hansen <dave.hansen@intel.com>
Cc: linux-kernel@vger.kernel.org, Rajnesh Kanwal <rkanwal@rivosinc.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, linux-coco@lists.linux.dev, 
	Dylan Reid <dylan@rivosinc.com>, abrestic@rivosinc.com, 
	Samuel Ortiz <sameo@rivosinc.com>, Christoph Hellwig <hch@infradead.org>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jiri Slaby <jirislaby@kernel.org>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Uladzislau Rezki <urezki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2023 at 7:18=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 4/21/23 12:24, Atish Kumar Patra wrote:
> > On Fri, Apr 21, 2023 at 3:46=E2=80=AFAM Dave Hansen <dave.hansen@intel.=
com> wrote:>> This callback appears to say to the host:
> >>
> >>         Hey, I (the guest) am treating this guest physical area as MMI=
O.
> >>
> >> But the host and guest have to agree _somewhere_ what the MMIO is used
> >> for, not just that it is being used as MMIO.
> >
> > Yes. The TSM (TEE Security Manager) which is equivalent to TDX also
> > needs to be aware of the MMIO regions so that it can forward the
> > faults accordingly. Most of the MMIO is emulated in the host
> > (userspace or kernel emulation if present). The host is outside the
> > trust boundary of the guest. Thus, guest needs to make sure the host
> > only emulates the designated MMIO region. Otherwise, it opens an
> > attack surface from a malicious host.
> How does this mechanism stop the host from emulating something outside
> the designated region?
>
> On TDX, for instance, the guest page table have a shared/private bit.
> Private pages get TDX protections to (among other things) keep the page
> contents confidential from the host.  Shared pages can be used for MMIO
> and don't have those protections.
>
> If the host goes and tries to flip a page from private->shared, TDX
> protections will kick in and prevent it.
>
> None of this requires the guest to tell the host where it expects MMIO
> to be located.
>
> > All other confidential computing solutions also depend on guest
> > initiated MMIO as well. AFAIK, the TDX & SEV relies on #VE like
> > exceptions to invoke that while this patch is similar to what pkvm
> > does. This approach lets the enlightened guest control which MMIO
> > regions it wants the host to emulate.
>
> I'm not _quite_ sure what "guest initiated" means.  But SEV and TDX
> don't require an ioremap hook like this.  So, even if they *are* "guest
> initiated", the question still remains how they work without this patch,
> or what they are missing without it.
>

Maybe I misunderstood your question earlier. Are you concerned about guests
invoking any MMIO region specific calls in the ioremap path or passing
that information to the host ?
Earlier, I assumed the former but it seems you are also concerned
about the latter as well. Sorry for the confusion in that case.
The guest initiation is necessary while the host notification can be
made optional.
The "guest initiated" means the guest tells the TSM (equivalent of TDX
module in RISC-V) the MMIO region details.
The TSM keeps a track of this and any page faults that happen in that
region are forwarded
to the host by the TSM after the instruction decoding. Thus TSM can
make sure that only ioremapped regions are
considered MMIO regions. Otherwise, all memory outside the guest
physical region will be considered as the MMIO region.

In the current CoVE implementation, that MMIO region information is also
passed to the host to provide additional flexibility. The host may
choose to do additional
sanity check and bail if the fault address does not belong to
requested MMIO regions without
going to the userspace. This is purely an optimization and may not be manda=
tory.


> > It can be a subset of the region's host provided the layout. The
> > guest device filtering solution is based on this idea as well [1].
> >
> > [1] https://lore.kernel.org/all/20210930010511.3387967-1-sathyanarayana=
n.kuppuswamy@linux.intel.com/
>
> I don't really see the connection.  Even if that series was going
> forward (I'm not sure it is) there is no ioremap hook there.  There's
> also no guest->host communication in that series.  The guest doesn't
> _tell_ the host where the MMIO is, it just declines to run code for
> devices that it didn't expect to see.
>

This is a recent version of the above series from tdx github. This is
a WIP as well and has not been posted to
the mailing list. Thus, it may be going under revisions as well.
As per my understanding the above ioremap changes for TDX mark the
ioremapped pages as shared.
The guest->host communication happen in the #VE exception handler
where the guest converts this to a hypercall by invoking TDG.VP.VMCALL
with an EPT violation set. The host would emulate an MMIO address if
it gets an VMCALL with EPT violation.
Please correct me if I am wrong.

As I said above, the objective here is to notify the TSM where the
MMIO is. Notifying the host
is just an optimization that we choose to add. In fact, in this series
the KVM code doesn't do anything with that information.
The commit text probably can be improved to clarify that.


> I'm still rather confused here.
