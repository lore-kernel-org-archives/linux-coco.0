Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92C8100B3
	for <linux-coco@lists.linux.dev>; Fri, 23 Jun 2023 17:18:12 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-bfe92598ffaso1330828276.0
        for <linux-coco@lists.linux.dev>; Fri, 23 Jun 2023 10:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687540691; x=1690132691;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=llENVEVx7donIYNakxUVI5MpG0GOiTfcMTyN4fUp0rU=;
        b=Ifcy3ssUA3HatTYBLoALBoi9rv2zfki+BjLQSSPjp/djklT3LGTpbVicEHGxmSnXhv
         dhqArvs+Ka9XA9Tri/jrOYf5B+vXeVX1+q+tiKDdTFkiOKvv3EAezjH1wUFgtKhByuW4
         nkuLUsoB2Co3FPIdNTySgRNJ1HruWY4kF/IM0BylsmhE0mHrAKKoD+NIPSBUOYCLVbkI
         /WERtK+Cy+ZeRkzKDyBUC6XKmKcyZeB6y1mCNSUarLC+O2fzKDMJIo9yTOS0MYy8Umkn
         2mv49pV0mG+U2D0L70810PlbXGmrm5mVRyGl4EMMPSGTO9gQhlDTLzmQIrbSGnpDgcaT
         tjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687540691; x=1690132691;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=llENVEVx7donIYNakxUVI5MpG0GOiTfcMTyN4fUp0rU=;
        b=Wr3cbK5OA2lFXBdPKrU5iZboS9l7GiLUSXcw9/A2+Lw4PtMtxHfgku8/luMxHcnPI+
         OIKfnKUg1t+NEg/yUb7cvQwNCXUdjaZ/dnJRzcSFYQ77zoeJetFJ6KcuPVqjrQw6n4xk
         L2OUbDK4+l+0AEknvQY3IQCaaEwbylMAsEH+8BqZ1PWkNqHn58/qyuJof86Aiv042L3b
         0RyhlIuS57iDSmbIwgathKmGFtbtlPIDXgmcTIhMuikaSRTuycGBCfoRS5jPNh19Dphd
         e8HPBvdpBEaPG3xTGdy1q8VLJLdBFClJmeOs+PJ4D0rNJrwzTGyVycDaJbU2QFeE138q
         HWeg==
X-Gm-Message-State: AC+VfDzxdX2//4fGIQvHS0ORDwisCFyRJI/WaxcK+4yXEV9X8Ys3ZyWZ
	sCy+WsinVaxTmAFUnH4BWESK9kzU3LI=
X-Google-Smtp-Source: ACHHUZ62Gq2iXbpG7c3hMYxbvQB2JgxITH9gLGvurS/GarPXE22jpxvivXwTyq8j5ROsi0j8F8XOxvxGh9s=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:b1a3:0:b0:ba8:373e:acf1 with SMTP id
 h35-20020a25b1a3000000b00ba8373eacf1mr9942356ybj.12.1687540691579; Fri, 23
 Jun 2023 10:18:11 -0700 (PDT)
Date: Fri, 23 Jun 2023 10:18:09 -0700
In-Reply-To: <20230623025429.GB3436214@ls.amr.corp.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1687474039.git.isaku.yamahata@intel.com>
 <b659f86ac7128965e05a7a660c38734667530fc0.1687474039.git.isaku.yamahata@intel.com>
 <37b868c53c9f35e8ec051573562a4598df38d72d.camel@intel.com> <20230623025429.GB3436214@ls.amr.corp.intel.com>
Message-ID: <ZJXS7tU6iukBXSuv@google.com>
Subject: Re: [RFC PATCH v2 3/6] KVM: x86/mmu: Pass round full 64-bit error
 code for the KVM page fault
From: Sean Christopherson <seanjc@google.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Cc: Kai Huang <kai.huang@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, Vishal Annapurve <vannapurve@google.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, Bo2 Chen <chen.bo@intel.com>, 
	Sagi Shahar <sagis@google.com>, Erdem Aktas <erdemaktas@google.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "dmatlack@google.com" <dmatlack@google.com>, 
	"zhi.wang.linux@gmail.com" <zhi.wang.linux@gmail.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2023, Isaku Yamahata wrote:
> On Thu, Jun 22, 2023 at 11:28:22PM +0000,
> Kai Huang <kai.huang@intel.com> wrote:
>=20
> > On Thu, 2023-06-22 at 16:16 -0700, Yamahata, Isaku wrote:
> > > The upper 32 bits of error code are discarded at kvm_mmu_page_fault()
> > > by lower_32_bits().=EF=BF=BD Now it's passed down as full 64 bits.
> > > Because only FNAME(page_fault) depends on it, move lower_32_bits() in=
to
> > > FNAME(page_fault).
> >=20
> > I haven't looked into the code yet, but the last sentence around
> > FNAME(page_fault) doesn't make a lot sense IIUC?
> >=20
> > For instance, we can have a shadow EPT table when EPT is enabled in L0 =
and
> > exposed to L1.  If we want to pass 64-bit error code to the handler, ho=
w can
> > FRAME(page_fault)() depend on the lower 32-bit value?=20
>=20
> Probably "depend" was too strong. In short, I wanted to not change the va=
lue
> passed down as error_code from FNAME(page_fault).
>=20
> FNAME(page_fault) calls helper function to walk page tables. Some check
> PFERR_IMPLICIT_ACCESS_MASK(48 bit).

Argh, IMPLICIT_ACCESS is a KVM-defined value without any sanity checks agai=
nst it
being used by hardware.

> If we don't mask lower_32_bits(), it can
> pass accidentally the bit.  Maybe we can audit the code carefully to chec=
k if
> IMPLICIT_ACCESS bit doesn't matter or fix it.  But I don't want to do it =
with
> this patch series.

No.  Going halfway on something like this is exactly how we end up with cod=
e that
no one understands and exists only because of "hysterical raisins".

There's no reason not to fix this properly.  It's obviously not your fault =
that
commit 147277540bbc ("kvm: svm: Add support for additional SVM NPF error co=
des")
took a shortcut, but that doesn't mean it's ok to keep punting the proper f=
ix to
a future developer.

One of the things I've been trying to drill into people's heads by harping =
on
writing tests is that trying to do the least amount of work to get some new=
fangled
feature merged is not a winning strategy.  The more work that is done upfro=
nt by
developers, the less work that needs to be done by reviewers and maintainer=
s.  It's
definitely not a 1:1 ratio, i.e. you doing an extra hour of work doesn't sa=
ve me an
hour of work, but since reviewers and maintainers are a relatively scarce r=
esource,
shifting work to developers almost always results in moving faster overall.=
  And
many times, doing more work upfront *does* require less effort overall, e.g=
. in
this case, we'll probably have spent more time discussing this than it woul=
d have
taken to audit the code in the first place.

As for IMPLICIT_ACCESS, that can and should be handled by asserting that th=
e flag
isn't set by hardware, and if it is, suppressing the bit so that KVM doesn'=
t
misinterpret an unknown hardware flag as IMPLICIT_ACCESS.

I'll test the below and post it separately, but feel free to incorporate it=
 into
this series, I'll make sure everything gets ordered correctly if/when all o=
f this
gets applied.

--
From: Sean Christopherson <seanjc@google.com>
Date: Fri, 23 Jun 2023 09:46:38 -0700
Subject: [PATCH] KVM: x86/mmu: Guard against collision with KVM-defined
 PFERR_IMPLICIT_ACCESS

Add an assertion in kvm_mmu_page_fault() to ensure the error code provided
by hardware doesn't conflict with KVM's software-defined IMPLICIT_ACCESS
flag.  In the unlikely scenario that future hardware starts using bit 48
for a hardware-defined flag, preserving the bit could result in KVM
incorrectly interpreting the unknown flag as KVM's IMPLICIT_ACCESS flag.

WARN so that any such conflict can be surfaced to KVM developers and
resolved, but otherwise ignore the bit as KVM can't possibly rely on a
flag it knows nothing about.

Fixes: 4f4aa80e3b88 ("KVM: X86: Handle implicit supervisor access with SMAP=
")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 60397a1beda3..228a483d3746 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5742,6 +5742,17 @@ int noinline kvm_mmu_page_fault(struct kvm_vcpu *vcp=
u, gpa_t cr2_or_gpa, u64 err
 	int r, emulation_type =3D EMULTYPE_PF;
 	bool direct =3D vcpu->arch.mmu->root_role.direct;
=20
+	/*
+	 * IMPLICIT_ACCESS is a KVM-defined flag used to correctly perform SMAP
+	 * checks when emulating instructions that triggers implicit access.
+	 * WARN if hardware generates a fault with an error code that collides
+	 * with the KVM-defined value.  Clear the flag and continue on, i.e.
+	 * don't terminate the VM, as KVM can't possibly be relying on a flag
+	 * that KVM doesn't know about.
+	 */
+	if (WARN_ON_ONCE(error_code & PFERR_IMPLICIT_ACCESS))
+		error_code &=3D ~PFERR_IMPLICIT_ACCESS;
+
 	if (WARN_ON(!VALID_PAGE(vcpu->arch.mmu->root.hpa)))
 		return RET_PF_RETRY;
=20

base-commit: 293375bf2fd333e5563dd80b894725b90cd84c5d
--
