Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3BD47A876
	for <linux-coco@lists.linux.dev>; Wed, 19 Aug 2026 15:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787154989; cv=none; b=BOz1tCG+wWj8cIOQ1FqNMgJdkpaxytz44q4lDPKCFqZyjBRe9fd4XoS2l9rzj7UShZNxbLjJs+wBNkBpN5pOB9vgFkWJP+SEvppEvOAmRGNZ0w+NeYaWmliqkKe7bqgvXRZ5bDbnVI05cLZYNTkedH+YRJ31UygpxqQgMD8+v9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787154989; c=relaxed/simple;
	bh=B8O9H5+dFhr0YZQyboPpZlhg/Dmx7yN13FUOyIt60Os=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Md47veTg3OXBVEl03DphNbFw291/3br0fmXYXbNPkiUFGCxz8a1dVKRI0XRx8WcKQw93U3OWHkcGIsu0g9N+uPOzdDwDpv/LznTg4/IvSrhsyClJ2S1FZeJdjeDFhxLF6jfkO7R3Ohbw9tP6TTLJOHCkqgRJTsk0sFNFLyOYwPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UqYz4271; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UqYz4271"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccd1958e8fso18039115ad.2
        for <linux-coco@lists.linux.dev>; Wed, 19 Aug 2026 08:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787154986; x=1787759786; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C3/tUlvf/a0JBJGZcfbwdageufimEuo+Kj8f0saPyZA=;
        b=UqYz4271LOpNri9nTWJPUraZq/2eaGUvusEabpVFDkPlSG01K5PriIsIF1s2ATkZo3
         5t1ZTX/nza4kXmAwzwPPnMmsKj/25OhkYMsCyfhRVlNTWsGLcGNz5SYZuEx7BPZJqWlf
         +k/Oi9K2n2+kDMkVa40ck8To3laJwlZCWhb4GVWrcJmUb1jR7HNqHh08TSqWGqfHFPF3
         raPGiB6VB+PlFaw96Hmij0lZaJ63nM6EVyRkyYDuG5tc+RMEFJdXkZurReI7Sxwn6/AG
         bgzHC2AyUhCv1ltQtQ/rF3L/9gzob5HW3rLdeWR4dwiEbCCyY5N2hR1H69O/YF3IUYV4
         5h6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787154986; x=1787759786;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C3/tUlvf/a0JBJGZcfbwdageufimEuo+Kj8f0saPyZA=;
        b=NoTpbwrIteIFRRnx15ih1rxgHRKucjf6OpVKnlumlGVtnp5gK0lEUvj91PpfxA2Il3
         Y22ysFaZjZPy+fhMFlh9qKApJVP9nfuBuXd3os1bQ+Ob/aSezri33ydFrsLzxfwANBwG
         F/3VPxB4+hAzVLHLI/CvNCpVj7RthfbkMBkSdk9TIkCvVvKl49YUrmDXEuid5H77czJ1
         MKsO1amaOHEIhkBp+H7hp9Mao6b+p816uEDbnTJlM/oZNX4Vt5hyKk6CDbdqR6dh+zFi
         rRwje+mA5FV04D8h5cHc3wxaVvVRk4wjweB8oNNaIILq2knGXRsyH+R9r47dEAruV46b
         xYfg==
X-Forwarded-Encrypted: i=1; AHgh+RodUCWkQ7Oe/dNKQl7Iz9+5QVJNCJ4H/ykYIVfHXM0idzsSXHnBZXrFEP95f2Ed368/G4wcoiMi8LiY@lists.linux.dev
X-Gm-Message-State: AFuF++kexXoN/rBBGCythW+auI++1nRRmrzD1MpxF04/wFmcMNlMwuZk
	SyBHD3nDeXTyUml+D8ZDZpxUXMf9FQJYFDQ7vGJM1sSKA/Q1MtK4u5iET7j9skp6zChuTM7k9KX
	AXQU+Mg==
X-Received: from plbkv11.prod.google.com ([2002:a17:903:28cb:b0:2ce:aea4:5e73])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:fb0:b0:2c2:62ee:5a0d
 with SMTP id d9443c01a7336-2d601e88fabmr106415295ad.14.1787154985585; Wed, 19
 Aug 2026 08:56:25 -0700 (PDT)
Date: Wed, 19 Aug 2026 08:56:24 -0700
In-Reply-To: <bd8f77eb6605f771fafbcef55a47211ecbb70e19.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260814224509.2342760-1-seanjc@google.com> <3a622cdb03b553cc9f8ce55b6df3c0091b3b06b9.camel@intel.com>
 <aoT_6cnARCAYTrYG@google.com> <bd8f77eb6605f771fafbcef55a47211ecbb70e19.camel@intel.com>
Message-ID: <aoXSKH4QLTA5DTXe@google.com>
Subject: Re: [PATCH] KVM: VMX: Explicitly track TDX VMs' root level instead of
 guessing it from CPUID
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	Kai Huang <kai.huang@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026, Rick P Edgecombe wrote:
> On Tue, 2026-08-18 at 17:59 -0700, Sean Christopherson wrote:
> > > Wait, no, this knowledge embeds in kvm_mmu_set_mirror_root_level() an=
yway.
> > > So I'd think to just have the below.=20
> >=20
> > I started with that, but I didn't like bleeding that level of detail in=
to the
> > MMU.=C2=A0 Or rather, I didn't like baking in the assumption that there=
 is exactly
> > one "direct bits", that the one bit is a pivot between normal and mirro=
r root,
> > and that the pivot bit is the most significant bit of the effective GPA=
 space.
> >=20
> > On the other hand, the MMU already knows about mirror roots, and needs =
to know
> > that mirror roots can have predetermined levels, so explicitly storing =
that
> > level doesn't add new assumptions.
>=20
> Yea.

Hmm, but an argument against this exact patch is that this code:

static __always_inline void kvm_mmu_set_mirror_root_level(struct kvm *kvm,
                                                         int level)
{
       BUILD_BUG_ON(level !=3D 4 && level !=3D 5);

       kvm->arch.mirror_root_level =3D level;
       kvm->arch.gfn_direct_bits =3D gpa_to_gfn(BIT_ULL(level =3D=3D 4 ? 47=
 : 51));
}

completely undermines the argument that exactly how TDX uses gfn_direct_bit=
s is
an implementation detail that we don't want to bleed into the MMU.  That's =
easy
enough to address though, just move the helper into tdx.c.

> And with the log as is, the exact reasoning to add a mirror_root_level is=
 not
> clear. To me at least. So if we want to keep it, some extra justification=
 would
> help.

How about this (to replace the existing one that talks about gfn_direct_bit=
s)?

    Don't use kvm_gfn_direct_bits() to infer the mirror root level, as the
    connection between TDX's one and only "direct" bit and the predetermine=
d
    root level is a TDX implementation detail.  I.e. avoid baking in the
    assumption that there is exactly one "direct bits", that the one bit is=
 a
    pivot between normal and mirror roots, and that the pivot bit is the mo=
st
    significant bit of the effective GPA space.  For the same reason, set t=
he
    root level and direct bits in TDX code, i.e. don't provide a helper in =
the
    MMU, because from the MMU's perspective, they are two separate concepts=
.
   =20
    Keep gfn_direct_bits even though it can be trivially derived from
    mirror_root_level as saving a whole eight bytes per VM is meaningless,
    keeping the TDX details buring in TDX would require a kvm_x86_ops hook,=
 and
    the value is queried fairly often and in hot paths.

> But for a bug fix, I'd think to keep it simple and then do mirror_root_le=
vel
> as a separate change.

FWIW, I don't view keying off gfn_direct_bits as being simpler.  It might b=
e less
code, but conceptually it's more complex when reading kvm_mmu_get_tdp_level=
().
E.g. the comment would need to explain the connection between "direct bits"=
 and
the mirror root level, which most non-TDX readers simply won't care about.

Hmm, but the comment I provided isn't very good either, as it too bleeds in=
 details
about the S-bit pivot, and at the end of the day that's not the true reason=
 why the
mirror root has/needs a predefined level.  The true reason is very simple: =
KVM
needs to mirror the external page tables, and obviously that means using th=
e same
number of levels.

	/*
	 * If the VM has mirror roots, then the root level is predefined as the
	 * mirror root (and by extension the normal root) needs to match the
	 * root level that was configured for the external page tables that are
	 * being mirrored by KVM.
	 */
	if (vcpu->kvm->arch.mirror_root_level)
		return vcpu->kvm->arch.mirror_root_level;

But IMO that's a moot point, because this isn't a matter of simple vs. comp=
lex.
Keying of gfn_direct_bits is wrong/flawed, so whether or not it's simpler i=
s
irrelevant.

All in all, this?

From: Sean Christopherson <seanjc@google.com>
Date: Fri, 14 Aug 2026 07:50:32 -0700
Subject: [PATCH] KVM: VMX: Explicitly track TDX VMs' root level instead of
 guessing it from CPUID

Explicitly track the root level for TDX VMs instead of trying to infer the
depth of the paging tree based on an individual vCPU's CPUID information.
Applying KVM's existing logic to select the root level to TDX is flawed as
nothing *requires* userspace to fill in the correct guest.MAXPHYADDR for a
vCPU's CPUID.  Guessing at the correct root level is also ridiculous given
that userspace has already told KVM the root level during TD initialization=
.

Relying on userspace to set the expected/correct CPUID lets a misbehaving
userspace trip the KVM_BUG_ON() in tdx_load_mmu_pgd() by configuring guest
CPUID to use an "incorrect" guest.MAXPHYADDR.

Don't use kvm_gfn_direct_bits() to infer the mirror root level, as the
connection between TDX's one and only "direct" bit and the predetermined
root level is a TDX implementation detail.  I.e. avoid baking in the
assumption that there is exactly one "direct bits", that the one bit is a
pivot between normal and mirror roots, and that the pivot bit is the most
significant bit of the effective GPA space.  For the same reason, set the
root level and direct bits in TDX code, i.e. don't provide a helper in the
MMU, because from the MMU's perspective, they are two separate concepts.

Keep gfn_direct_bits even though it can be trivially derived from
mirror_root_level as saving a whole eight bytes per VM is meaningless,
keeping the TDX details buring in TDX would require a kvm_x86_ops hook, and
the value is queried fairly often and in hot paths.

Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Kai Huang <kai.huang@intel.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>
Fixes: 20d913729c11 ("KVM: x86/mmu: Taking guest pa into consideration when=
 calculate tdp level")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  1 +
 arch/x86/kvm/cpuid.c            | 14 --------------
 arch/x86/kvm/cpuid.h            |  1 -
 arch/x86/kvm/mmu/mmu.c          | 18 ++++++++++--------
 arch/x86/kvm/vmx/tdx.c          | 20 +++++++++++---------
 5 files changed, 22 insertions(+), 32 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_hos=
t.h
index 283847619ff8..b2a74c69cc4a 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1406,6 +1406,7 @@ struct kvm_arch {
 	struct kvm_mmu_memory_cache split_desc_cache;
=20
 	gfn_t gfn_direct_bits;
+	int mirror_root_level;
=20
 	/*
 	 * Size of the CPU's dirty log buffer, i.e. VMX's PML buffer. A Zero
diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index ddb022cb203a..34c609a60eef 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -483,20 +483,6 @@ int cpuid_query_maxphyaddr(struct kvm_vcpu *vcpu)
 	return 36;
 }
=20
-int cpuid_query_maxguestphyaddr(struct kvm_vcpu *vcpu)
-{
-	struct kvm_cpuid_entry2 *best;
-
-	best =3D kvm_find_cpuid_entry(vcpu, 0x80000000);
-	if (!best || best->eax < 0x80000008)
-		goto not_found;
-	best =3D kvm_find_cpuid_entry(vcpu, 0x80000008);
-	if (best)
-		return (best->eax >> 16) & 0xff;
-not_found:
-	return 0;
-}
-
 /*
  * This "raw" version returns the reserved GPA bits without any adjustment=
s for
  * encryption technologies that usurp bits.  The raw mask should be used i=
f and
diff --git a/arch/x86/kvm/cpuid.h b/arch/x86/kvm/cpuid.h
index 8d863f45585d..46bfe8699e67 100644
--- a/arch/x86/kvm/cpuid.h
+++ b/arch/x86/kvm/cpuid.h
@@ -68,7 +68,6 @@ void __init kvm_init_xstate_sizes(void);
 u32 xstate_required_size(u64 xstate_bv, bool compacted);
=20
 int cpuid_query_maxphyaddr(struct kvm_vcpu *vcpu);
-int cpuid_query_maxguestphyaddr(struct kvm_vcpu *vcpu);
 u64 kvm_vcpu_reserved_gpa_bits_raw(struct kvm_vcpu *vcpu);
=20
 static inline int cpuid_maxphyaddr(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index c519e8e8d646..c78897510a1e 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5928,19 +5928,21 @@ void __kvm_mmu_refresh_passthrough_bits(struct kvm_=
vcpu *vcpu,
=20
 static inline int kvm_mmu_get_tdp_level(struct kvm_vcpu *vcpu)
 {
-	int maxpa;
-
-	if (vcpu->kvm->arch.vm_type =3D=3D KVM_X86_TDX_VM)
-		maxpa =3D cpuid_query_maxguestphyaddr(vcpu);
-	else
-		maxpa =3D cpuid_maxphyaddr(vcpu);
-
 	/* tdp_root_level is architecture forced level, use it if nonzero */
 	if (tdp_root_level)
 		return tdp_root_level;
=20
+	/*
+	 * If the VM has mirror roots, then the root level is predefined as the
+	 * mirror root (and by extension the normal root) needs to match the
+	 * root level that was configured for the external page tables that are
+	 * being mirrored by KVM.
+	 */
+	if (vcpu->kvm->arch.mirror_root_level)
+		return vcpu->kvm->arch.mirror_root_level;
+
 	/* Use 5-level TDP if and only if it's useful/necessary. */
-	if (max_tdp_level =3D=3D 5 && maxpa <=3D 48)
+	if (max_tdp_level =3D=3D 5 && cpuid_maxphyaddr(vcpu) <=3D 48)
 		return 4;
=20
 	return max_tdp_level;
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index b272c20586a7..a0bc9f818f43 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -56,9 +56,6 @@
 bool enable_tdx __ro_after_init;
 module_param_named(tdx, enable_tdx, bool, 0444);
=20
-#define TDX_SHARED_BIT_PWL_5 gpa_to_gfn(BIT_ULL(51))
-#define TDX_SHARED_BIT_PWL_4 gpa_to_gfn(BIT_ULL(47))
-
 static const struct tdx_sys_info *tdx_sysinfo;
=20
 void tdh_vp_rd_failed(struct vcpu_tdx *tdx, char *uclass, u32 field, u64 e=
rr)
@@ -1609,10 +1606,7 @@ static int handle_tdvmcall(struct kvm_vcpu *vcpu)
=20
 void tdx_load_mmu_pgd(struct kvm_vcpu *vcpu, hpa_t root_hpa, int pgd_level=
)
 {
-	u64 shared_bit =3D (pgd_level =3D=3D 5) ? TDX_SHARED_BIT_PWL_5 :
-			  TDX_SHARED_BIT_PWL_4;
-
-	if (KVM_BUG_ON(shared_bit !=3D kvm_gfn_direct_bits(vcpu->kvm), vcpu->kvm)=
)
+	if (KVM_BUG_ON(pgd_level !=3D vcpu->kvm->arch.mirror_root_level, vcpu->kv=
m))
 		return;
=20
 	td_vmcs_write64(to_tdx(vcpu), SHARED_EPT_POINTER, root_hpa);
@@ -2760,6 +2754,14 @@ DEFINE_CLASS(tdx_vm_state_guard, tdx_vm_state_guard_=
t,
 	     if (!IS_ERR(_T)) tdx_release_vm_state_locks(_T),
 	     tdx_acquire_vm_state_locks(kvm), struct kvm *kvm);
=20
+static __always_inline void tdx_set_mirror_root_level(struct kvm *kvm, int=
 level)
+{
+	BUILD_BUG_ON(level !=3D 4 && level !=3D 5);
+
+	kvm->arch.mirror_root_level =3D level;
+	kvm->arch.gfn_direct_bits =3D gpa_to_gfn(BIT_ULL(level =3D=3D 4 ? 47 : 51=
));
+}
+
 static int tdx_td_init(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
 {
 	struct kvm_tdx_init_vm __user *user_data =3D u64_to_user_ptr(cmd->data);
@@ -2823,9 +2825,9 @@ static int tdx_td_init(struct kvm *kvm, struct kvm_td=
x_cmd *cmd)
 	kvm_tdx->xfam =3D td_params->xfam;
=20
 	if (td_params->config_flags & TDX_CONFIG_FLAGS_MAX_GPAW)
-		kvm->arch.gfn_direct_bits =3D TDX_SHARED_BIT_PWL_5;
+		tdx_set_mirror_root_level(kvm, 5);
 	else
-		kvm->arch.gfn_direct_bits =3D TDX_SHARED_BIT_PWL_4;
+		tdx_set_mirror_root_level(kvm, 4);
=20
 	kvm_tdx->state =3D TD_STATE_INITIALIZED;
 out:

base-commit: 1b731e5ded480bd1e5546aed35584238661ce72e
--
