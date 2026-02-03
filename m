Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBC33AE707
	for <linux-coco@lists.linux.dev>; Tue,  3 Feb 2026 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770133274; cv=none; b=CcTt2pPOPlBFz57k4SKX8QsSpksAAvUrgOtCi4VSJTw4bHIknBFGTZYegwpJc0Pg+COz+fqAhGMUn4SXmv7V1I9Oum/iPg4psiPzWxe54OPia9AutvipxI12ZgRORi0pWeGzjiwuJDQSpHraoXIXMgrq+Sv02bC0Beadk+y7eGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770133274; c=relaxed/simple;
	bh=XQ27+R+QYeCRopvq+/032ZUkzbH3fabnjh5Y36ub2sY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VMvB62sPb4FmiR+ZmeEDIIx4+PFruWeO6RwbRrZbYX+3G1nwuSXw2b8xa/QOef85Z4q0ZvWGNVWiYVvrF3FMSnOZa7s5pw+JSwcr15SIUSuIrmgpG+pE6+9MJsNIo/tIMtyk+1s7VFudTfGMcXkhlZdk96Oac4RQ2d520BXNmTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rYBESa7E; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rYBESa7E"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c5291b89733so3575013a12.0
        for <linux-coco@lists.linux.dev>; Tue, 03 Feb 2026 07:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770133272; x=1770738072; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XWJ660ihJM0hSjFDBVQ0+kuafEpX+U2YAW70nt2lVVE=;
        b=rYBESa7E5U2GoztIhLJiIE1xNS3/tP8ebWcjon2xlz7oJnBM0WRz+8/rfH6+5QS1PP
         FUMHnH57GqBJI6g3bGWPdh71LUwdMulMWbobEOcKBcQWpf+x6MvMXXFiEuW9P5s66wce
         Ee30VFiOUINwkWFgaw960Psi/Q6sYMYA/i2AHR93AsG5RP1DgQ9Bap6ReR6ZOJEmt8qc
         bXJxNH6KVrDDmj4LFU7HfzYzKWpFhK0BCfHV/0wKwLPCrL6X/qmHAYY/VB2kSRsAH4UP
         d9VbjwG4/z4MKjgVc6qsUkODVVkWMRENlBLRBJGqj/0O2LDx64XATYMFJ88mMXtj5YAM
         bApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770133272; x=1770738072;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XWJ660ihJM0hSjFDBVQ0+kuafEpX+U2YAW70nt2lVVE=;
        b=YRzn+uuuV+qiPM5NyTWc7vOv7i4xRwdYkoNK1tylES+6+19oYDktUfZDMKwEKkSlD2
         /36/jvguvOOo+rBxjJJxHSShPCKovLM3NAWAB5HGjqu2AY92/rzwYXOuoEaEwCwsx9Ng
         wgtmk3RpaPHkLRH/V9Rx6puno7OZVUwiYLxd7SmI/9S+RNOOt57P2bLyevq5nASBGfm8
         hMqCsY/c/RQn8Ub/+M0Vqn+bGCNFpBfeLiVnhhUpc8xFsQqejlEIkzCc7b2wo1puYEPO
         /jY0t0Ekl7KR9X4D+hhipPHFuycwIqh06BBN5LtnmAvTrjJMnF0r+DVO+/0yJvi26169
         etJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtyzt2vcxJTQ/PrjdGsnW5WexV0+IX+FWimB6/JQTAl43rnuH4bn+can0luAK+ygsASgS6bYRf+/hv@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4+1nzbpdT4bOG+NFyGlHrF5EGlXXnBIiHDyaquLzGssiq5TWr
	2v6DHlLfDJqcfGeCAOPcPRSwg4mDJ6HibClY1YVxX0gobDShXqG9ZInrqgMCkGtAtnFTplqe5jE
	qDLAHjQ==
X-Received: from pglf30.prod.google.com ([2002:a63:101e:0:b0:c66:9115:3b4d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:e390:b0:38e:9220:ebbe
 with SMTP id adf61e73a8af0-392e003d35emr15312558637.23.1770133271757; Tue, 03
 Feb 2026 07:41:11 -0800 (PST)
Date: Tue, 3 Feb 2026 07:41:10 -0800
In-Reply-To: <aYHmUCLRYL+JX1ga@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260123145645.90444-1-chao.gao@intel.com> <20260123145645.90444-8-chao.gao@intel.com>
 <301f8156-bafe-440a-8628-3bf8fae74464@intel.com> <aXywVcqbXodADg4a@intel.com>
 <fedb3192-e68c-423c-93b2-a4dc2f964148@intel.com> <aYHmUCLRYL+JX1ga@intel.com>
Message-ID: <aYIXFmT-676oN6j0@google.com>
Subject: Re: [PATCH v3 07/26] x86/virt/seamldr: Introduce a wrapper for
 P-SEAMLDR SEAMCALLs
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: Dave Hansen <dave.hansen@intel.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, x86@kernel.org, 
	reinette.chatre@intel.com, ira.weiny@intel.com, kai.huang@intel.com, 
	dan.j.williams@intel.com, yilun.xu@linux.intel.com, sagis@google.com, 
	vannapurve@google.com, paulmck@kernel.org, nik.borisov@suse.com, 
	zhenzhong.duan@intel.com, rick.p.edgecombe@intel.com, kas@kernel.org, 
	dave.hansen@linux.intel.com, vishal.l.verma@intel.com, 
	Farrah Chen <farrah.chen@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 03, 2026, Chao Gao wrote:
> >>> I'd be shocked if this is the one and only place in the whole kernel
> >>> that can unceremoniously zap VMX state.
> >>>
> >>> I'd *bet* that you don't really need to do the vmptrld and that KVM c=
an
> >>> figure it out because it can vmptrld on demand anyway. Something alon=
g
> >>> the lines of:
> >>>
> >>> 	local_irq_disable();
> >>> 	list_for_each(handwaving...)
> >>> 		vmcs_clear();
> >>> 	ret =3D seamldr_prerr(fn, args);
> >>> 	local_irq_enable();=09
> >>>
> >>> Basically, zap this CPU's vmcs state and then make KVM reload it at s=
ome
> >>> later time.
> >>=20
> >> The idea is feasible. But just calling vmcs_clear() won't work. We nee=
d to
> >> reset all the tracking state associated with each VMCS. We should call
> >> vmclear_local_loaded_vmcss() instead, similar to what's done before VM=
XOFF.
> >>=20
> >>>
> >>> I'm sure Sean and Paolo will tell me if I'm crazy.
> >>=20
> >> To me, this approach needs more work since we need to either move=20
> >> vmclear_local_loaded_vmcss() to the kernel or allow KVM to register a =
callback.
> >>=20
> >> I don't think it's as straightforward as just doing the save/restore.
> >
> >Could you please just do me a favor and spend 20 minutes to see what
> >this looks like in practice and if the KVM folks hate it?

I hate it :-)

> Sure. KVM tracks the current VMCS and only executes vmptrld for a new VMC=
S if
> it differs from the current one. See arch/x86/kvm/vmx/vmx.c::vmx_vcpu_loa=
d_vmcs()
>=20
> 	prev =3D per_cpu(current_vmcs, cpu);
> 	if (prev !=3D vmx->loaded_vmcs->vmcs) {
> 		per_cpu(current_vmcs, cpu) =3D vmx->loaded_vmcs->vmcs;
> 		vmcs_load(vmx->loaded_vmcs->vmcs);
> 	}
>=20
> By resetting current_vmcs to NULL during P-SEAMLDR calls, KVM is forced t=
o do a
> vmptrld on the next VMCS load. So, we can implement seamldr_call() as:
>=20
> static int seamldr_call(u64 fn, struct tdx_module_args *args)
> {
> 	int ret;
>=20
> 	WARN_ON_ONCE(!is_seamldr_call(fn));
>=20
> 	/*
> 	 * Serialize P-SEAMLDR calls since only a single CPU is allowed to
> 	 * interact with P-SEAMLDR at a time.
> 	 *
> 	 * P-SEAMLDR calls invalidate the current VMCS. Exclude KVM access to
> 	 * the VMCS by disabling interrupts. This is not safe against VMCS use
> 	 * in NMIs, but there are none of those today.
> 	 *
> 	 * Set the per-CPU current_vmcs cache to NULL to force KVM to reload
> 	 * the VMCS.
> 	 */
> 	guard(raw_spinlock_irqsave)(&seamldr_lock);
> 	ret =3D seamcall_prerr(fn, args);
> 	this_cpu_write(current_vmcs, NULL);
>=20
> 	return ret;
> }
>=20
> This requires moving the per-CPU current_vmcs from KVM to the kernel, whi=
ch
> should be trivial with Sean's VMXON series.

Trivial in code, but I am very strongly opposed to moving current_vmcs out =
of KVM.
As stated in the cover letter of the initial VMXON RFC[*]:

 : Emphasis on "only", because leaving VMCS tracking and clearing in KVM is
 : another key difference from Xin's series.  The "light bulb" moment on th=
at
 : front is that TDX isn't a hypervisor, and isn't trying to be a hyperviso=
r.
 : Specifically, TDX should _never_ have it's own VMCSes (that are visible =
to the
 : host; the TDX-Module has it's own VMCSes to do SEAMCALL/SEAMRET), and so=
 there
 : is simply no reason to move that functionality out of KVM.

TDX's "use" of a VMCS should be completely transparent to KVM, because othe=
rwise
we are stepping over that line that says the TDX subsystem isn't a hypervis=
or.
I also really, really don't want to add a super special case rule to KVM's =
VMCS
tracking logic.

After reading through the rest of this discussion, I'm doubling down on tha=
t
stance, because I agree that this is decidely odd behavior.

Pulling in two other threads from this discussion:

On Wed, Jan 28, 2026 at 3:05=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 1/23/26 06:55, Chao Gao wrote:
> > SEAMRET from the P-SEAMLDR clears the current VMCS structure pointed
> > to by the current-VMCS pointer. A VMM that invokes the P-SEAMLDR
> > using SEAMCALL must reload the current-VMCS, if required, using the
> > VMPTRLD instruction.
>
> That seems pretty mean.
>
> This is going to need a lot more justification for why this is an
> absolutely necessary requirement.
>
> KVM folks, are you OK with this?

As above, I'm definitely not ok with the current VMCS being zapped out from
underneath KVM.  As to whether or not I'm ok with the P-SEAMLDR behavior, I=
 would
say that's more of a question for you, as it will fall on the TDX subsytem =
to
workaround the bug/quirk.

On Fri, Jan 30, 2026 at 8:23=E2=80=AFAM Dave Hansen <dave.hansen@intel.com>=
 wrote:
> On 1/30/26 00:08, Chao Gao wrote:
> > AFAIK, this is a CPU implementation issue. The actual requirement is to
> > evict (flush and invalidate) all VMCSs __cached in SEAM mode__, but big
> > cores implement this by evicting the __entire__ VMCS cache. So, the
> > current VMCS is invalidated and cleared.
>
> But why is this a P-SEAMLDR thing and not a TDX module thing?

My guess is that it's because the P-SEAMLDR code loads and prepares the new=
 TDX-
Module by constructing the VMCS used for SEAMCALL using direct writes to me=
mory
(unless that TDX behavior has changed in the last few years).  And so it ne=
eds
to ensure that in-memory representation is synchronized with the VMCS cache=
.

Hmm, but that doesn't make sense _if_ it really truly is SEAMRET that does =
the VMCS
cache invalidation, because flushing the VMCS cache would ovewrite the in-m=
emory
state.

> It seems like a bug, or at least a P-SEAMLDR implementation issue the
> needs to get fixed.

Yeah, 'tis odd behavior.  IMO, that's all the more reason the TDX subsystem=
 should
hide the quirk from the rest of the kernel.

[*] https://lore.kernel.org/all/20251010220403.987927-1-seanjc@google.com
