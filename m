Received: from mta0.migadu.com (out-193.mta0.migadu.com [91.218.175.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB5C439F7C
	for <linux-coco@lists.linux.dev>; Fri,  9 Oct 2026 14:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555685; cv=none; b=ugpDI/Ozgkn9gjmQuKF5ATdh+hIgE9tUwjiyu/2+pz0hMyY3hRhfARtB/PuF21HOBfzpq1WA/DONP+ZRS9bzvAPmxzqwlUOdfBeBAjUphoF2JVUNdhdMVhBsyLO9BB89S79hIAcVsLkNKJI3rqno41IyhS0oU0lubOOm22RKzNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555685; c=relaxed/simple;
	bh=XumFm+JZ5sp20UCcl1zhPKdv9LGzZM2iFj9GOxKc9Og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyke/HMhkmSHNScNOHFg9ejvvm70WVguQMiuZIHCFsdEVmit8TskoLo79fIZebT7AGdtoDkR46QZ756RuGBv+9o8unsAF+Rw80aFdeANdN5pjUAYpk/AbbhDsRIbcVVBR+DXBVwQZcVoN7l0UHBLSsmkCemD4Z5gMFVQLApU440=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rU7sJd0a; arc=none smtp.client-ip=91.218.175.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rU7sJd0a"
X-Envelope-To: linux-coco@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=XumFm+JZ5sp20UCcl1zhPKdv9LGzZM2iFj9GOxKc9Og=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791555681; v=1; x=1792160481;
 b=rU7sJd0aIZyW1n2XpvCgEvi4uvsqUf1ycvz5fvCBKAPzovW2xOyhs++OdP9ievfP5akKzAvO
 D2NJqpSF4Zp5P+3jPCFxR0XX2AK/LPQNZsaAxaKu0ZFhpfyHv2qsQye7I58s70A9BYqilcMToZF
 vVPVpz49013zzrF6jmvqa33o=
X-Envelope-To: linux-coco@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id be7122121adfae9c;
	Fri, 09 Oct 2026 14:21:21 +0000
X-Mizu-Trace-ID: be7122121adfae9c
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so7848e87.1
        for <linux-coco@lists.linux.dev>; Fri, 09 Oct 2026 07:21:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy58b4nI7Y3ZZ7fdmCtYSYhIdAMe4ht26p82vUPaormxcBhUTvLqJ6z9R2RDHh9RjqBvUfaEDN8YZIH@lists.linux.dev
X-Gm-Message-State: AFq9FYI1tDZJcnDAwOFHCmnEPLlrz6EOMObWnBJvCU3jCKk5Yzntb46G
	vXBEXDJC+0ptrHq1dh2QJmSnMmoaTUbA4LXU69ZrFjCD98xQHqimLEakLhQ0Rrc/OE+MZjr+FtQ
	Xh0chyf1Umgh2iksfg8PZS+Uqmnk7FW4xBfJvgZeu
X-Received: by 2002:a05:6512:1291:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5bcdf948b64mr90202e87.8.1791555680353; Fri, 09 Oct 2026
 07:21:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <179155224299.829527.1733164520192309991.b4-ty@b4>
In-Reply-To: <179155224299.829527.1733164520192309991.b4-ty@b4>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 9 Oct 2026 15:20:44 +0100
X-Gmail-Original-Message-ID: <CA+EHjTymHEqCJco+d_yy33ndqPPsoZARhOQZ5A0Zwc5N3SV4Qg@mail.gmail.com>
X-Gm-Features: AclHuK-kdu9KsnePYPGj9T-71wgfKb376h2mI-vnllt523DbHScqL5HOwi_XcNU
Message-ID: <CA+EHjTymHEqCJco+d_yy33ndqPPsoZARhOQZ5A0Zwc5N3SV4Qg@mail.gmail.com>
Subject: Re: [PATCH v23 00/14] KVM: arm64: CCA: Add basic plumbing for Realms
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, will@kernel.org, catalin.marinas@arm.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org, 
	gshan@redhat.com, joey.gouly@arm.com, yuzenghui@huawei.com, 
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, 
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com, 
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com, 
	jonathan.cameron@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Fri, 09 Oct 2026 14:28:03 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Of course, mmu.c is where the crap happens, so anyone with any interest
> in this stuff being halfway sane, please review the conflict resolution.

I went through the mmu.c resolution and it looks good to me. Unmap and
aging are still no-ops for protected VMs, their abort handler is
unchanged, and the default op keeps the tracked unmap for nested MMUs.
Two minor things you might want to tidy up.

kvm_vm_stage2_unmap_range() repeats the lockdep_assert_held_write()
and WARN_ON(size & ~PAGE_MASK) that kvm_stage2_unmap_range() already
does before calling the op.

The VM_WARN_ON_ONCE() in kvm_vm_mem_abort() reads the ESR from the
vcpu again, where next had moved these checks to s2fd->esr. It's the
same result today, since the only caller handles a real abort, but
this (and dropping the vcpu local) would keep it in line with the
rest:

        VM_WARN_ON_ONCE(kvm_s2_fault_is_perm(s2fd) &&
                        !esr_abt_is_write_fault(s2fd->esr) &&
                        !kvm_s2_fault_is_exec(s2fd));

Cheers,
/fuad
