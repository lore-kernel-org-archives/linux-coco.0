Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2C659E322
	for <linux-coco@lists.linux.dev>; Tue,  8 Sep 2026 19:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895129; cv=pass; b=X1ACBkVVaHVBxvPOFrlYVYbj+IYBF+wdsFnY8LqHqACBQ0x+m1s1CWooMUq3NFjFX3gyCPHMX/+myTEOoKvA3KOJFE6BjTEc30ehvYweUIRLOIbYNnT7FqLEAMvONNuWshJfnG8oFp4Ff2xHlz6RLlF9L/1vaFYfAKS3Kh5cbR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895129; c=relaxed/simple;
	bh=iF8wAwPOdw5l+3Cf+6kzkcaY9d4H9emgCFQIITZ4gH8=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bqLjOpDSYdYh4Q6SbrIP3bbycG3otwwnwMWmfVQUQkrh47zcvaGfnYwaw8uQNEFjlHMNHd4p0dE3ePSsnFmeYC45lSA1D9m5v2aKdRk+sYm5xt7P0NJefEoKDsRIlZBGRnWtlJJ6ytjXTzHgwpHfH59B1hxJ7x7IH5u5Ak5VW7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=THpp++E+; arc=pass smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="THpp++E+"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-90cc0ebbf4bso43885946d6.3
        for <linux-coco@lists.linux.dev>; Tue, 08 Sep 2026 12:18:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788895121; cv=none;
        d=google.com; s=arc-20260327;
        b=aYAr8KW6AuM1cYVmvWi+xE1eACLCRJvy/byiGaH/Enetuw+Qbah/CqkbZvCfXVe+YG
         XBUkfrKzhidJ/H6QP0mm27/jq31g1WqR8aj/5RQTDbxoWPk6RWSqL6BAoHumUlLOiIc3
         zCyC6q+v4wHoQmgZNpRjDppc0ogy3TIBn94eGSBF62C5rEJdyeSFflTQ/MsJYQKrDZvN
         x29zCVgmRPTQCtwxeNvNr3vI+bzExLmiL6C1DQvxNdg7XFjZzLlC3B6WX3uL3VxujAjc
         1XOpIC5j2IdnvLauqqIa/Ze9yHpdzESSK6jZ7iCKNWKHZCv8AOeUTpFj0X736jT1eKYV
         y2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=X8Qt7g6L7Ojilnm+sGhiq7WuzC+eIMrDfW/7+fmIyko=;
        fh=UiMaM5KB1SqIX12rP3HgPVylNej2tHxm4w/nuOOnxnw=;
        b=l/Q1R0COJPHOuEw9p34h3GsExn/OrsC5BTTlVQyBtpeDBsfXjW+85xBDubkIndEJ5K
         o1scT/yL/RaFzNc4Kx2baYggr9OtN9WpCpMigOkudwTekswhyDehPIln7SOAroxe5VXG
         HgqY1CFTGSfRRDK4KHapR4/rjtDJF6H6iVKhGwGZEaUVIqm6/6gmPCjnpLXoVrZTVCRY
         8nSZoQMhs977W0GqJ3PWQh0lrRKxXxm4GE9N4IzU+UM4xUX4OwranMIZcme+biEl/FW0
         rVkfsivYEjfmZ1EUuFGVE2RiacgDDPU23rLlPdxOFhle+f2L2+LgsHi3OewVY7WNtRo3
         rmFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788895121; x=1789499921; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8Qt7g6L7Ojilnm+sGhiq7WuzC+eIMrDfW/7+fmIyko=;
        b=THpp++E+AuADv/wtbPn3GaMNTzrY3FNHWySxR/eU0zF/w+IHvmrBcmjrsL917vE2pN
         eLVNJasZ3F2l51wzRB2DA+xP8QnAadUwn15EC5pLoCYMkCGCiO5Ls18p0cJnQkYiVkXx
         jSBQL/XDSmld7Mu5Bz9UFqle1H6qaxdKgwyScVEkVbhmFHZ+rofXYY4gbNtMyhAFhK5J
         ux16mG07cFGljxUBfo5AlYwANQR9w8jtPcyx6hv9sdSWFiTnumrsBAelfaGWn+dCQxH/
         DDZ4fijAqTbVx6aIOOmqKdND2/qoi65hzp5kcI58upJLILfKwAK6OwBimNFl6L0vpqrW
         EKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788895121; x=1789499921;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X8Qt7g6L7Ojilnm+sGhiq7WuzC+eIMrDfW/7+fmIyko=;
        b=qjH4OCr9ch0ACcXc1iFpGEjwap5HGhB9PPr2iwBN6UMf4LC8F2wvtLY7wni6Fi/QC/
         L0Q30+gF4bDh1g4SzLA/tdpvgbaFW9aUIUIu9joXKnRv6JyBqcPyVwVwUnQPAdpD8rjC
         ruLov9f2YbZMEinHzIPufj+1fK88xaifcnDlcFe4vfNb/8jB6gLQMZF/5IQd0QnOcvtp
         9oZ3nBG1aOZQZ8ijkTtDGDHCCmPExkT61DyXP+czbvZzuofWU744TYF4To1BHh3jW6ll
         D4QQbv5zbbDVLrG9elnZsKqLv78L5RMIQvv4tdJd+JV1FBYmGgwHMBeR+ozdyyA9Cxbj
         Fk4Q==
X-Forwarded-Encrypted: i=1; AKwUvBw1cOEFIrbwY2as94lKYpRLaukiFNn5z7LZe+edOnjwGDtNopeIsSwIGrP2a1r81SzZ4SpCA/LAyvF4@lists.linux.dev
X-Gm-Message-State: AFuF++lFYT3IULJuoLB6vVvvKFPAY4/6CG8lj4Bi3OxrKO50cSIPMnkH
	vKwOAZA0h42nmmiFWSbacgJKbBTN/0VmSMrf5+fpOPNdbMNr/vOBulRRedFRsQ5bHAQVfyu+80J
	7cPGS0kXDQT0+fKK+Uk5pKlbny9p+VQUBVoJNJI6N
X-Gm-Gg: AYBFou2q30wkd1JiYrUundQ2v5sEIhtSZvAvFgd0v8xOgCMP+0qMOPcfJX4GQZ7+Ws2
	LnFoKTNa1hkz/lyMOn+FOeBscGLQf72bXXC34aYzOAax56Dhvk8F4zGa4WzQafbFY3UnOfRy3Xi
	T5fnimG7Bfj2LHVEiNGAZn8SLLnESLfZYPhtEpYuhq+OFJ0FEOhnmLI9Iu8P1osQ2l50Fodn6P/
	+NhcMz7ZtJ2qls8/yqiScciiporBFvVqYPcoJWgO3URYCt1RinvkmmIGhO29K8W2vNIFWW32aid
	EQCjnIW6iDSdCvDvTgnH3G2TYvwO+zPCqmEaT48RJl1mC2+Lk5ESUDt+nN7dxNn6u5rund4FZBE
	KER1i96DkHHKiwiMaNgW5NKHym/KNYso=
X-Received: by 2002:a05:6214:8110:b0:90e:8d49:1ca2 with SMTP id
 6a1803df08f44-9103ef006e4mr328434076d6.2.1788895119795; Tue, 08 Sep 2026
 12:18:39 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:18:39 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:18:38 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260825081448.GB3694338@pedri>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-11-15ad654a50db@google.com> <20260825081448.GB3694338@pedri>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 12:18:38 -0700
X-Gm-Features: AcwNN1X5p6qITiCXmMYSZPSPB-N20ut6cFscoALs2WRbCQrztSKzH7k_if4I128
Message-ID: <CAEvNRgHiQ5g94SQ8S6CTyTmEOguQqY9GmQUu1K8ff9L1pALpQA@mail.gmail.com>
Subject: Re: [PATCH v14 11/22] KVM: selftests: Set up TDX boot parameters region
To: Peter Fang <peter.fang@intel.com>, Lisa Wang <wyihan@google.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Chao Gao <chao.gao@intel.com>, Chenyi Qiang <chenyi.qiang@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Erdem Aktas <erdemaktas@google.com>, 
	Ira Weiny <ira.weiny@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>, 
	Sagi Shahar <sagis@google.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Oliver Upton <oupton@kernel.org>, 
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Peter Fang <peter.fang@intel.com> writes:

> On Wed, Jul 22, 2026 at 11:13:16PM +0000, Lisa Wang wrote:
>> From: Sagi Shahar <sagis@google.com>
>>
>> Allocate memory for TDX boot parameters and define the utility functions
>> necessary to fill this memory with the boot parameters.
>>
>> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> Signed-off-by: Sagi Shahar <sagis@google.com>
>> Signed-off-by: Lisa Wang <wyihan@google.com>
>> ---
>>  .../selftests/kvm/include/x86/tdx/tdx_util.h       |  2 +
>>  tools/testing/selftests/kvm/lib/x86/processor.c    |  2 +
>>  tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c | 51 ++++++++++++++++++++++
>>  3 files changed, 55 insertions(+)
>>
>
> [ ... ]
>
>> +
>> +void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm)
>> +{
>> +	struct td_boot_parameters *params =
>> +		addr_gpa2hva(vm, TD_BOOT_PARAMETERS_GPA);
>> +	u32 cr4;
>> +
>> +	cr4 = kvm_get_default_cr4(vm->mmu.pgtable_levels);
>> +
>> +	/* TDX spec 11.6.2: CR4 bit MCE is fixed to 1 */
>> +	cr4 |= X86_CR4_MCE;
>> +
>> +	/* TDX spec 11.6.2: CR4 bit VMXE and SMXE are fixed to 0 */
>
>         This is now out of date (11.9.2 as of today)...
>         I wonder if it's better to just say something like: "Per the TDX
>         spec, ..."
>

Makes sense, thanks!

>> +	cr4 &= ~(X86_CR4_VMXE | X86_CR4_SMXE);
>> +
>> +	/* Set parameters! */
>> +	params->cr0 = kvm_get_default_cr0();
>> +	TEST_ASSERT(vm->mmu.pgd < (1ULL << 32),
>> +		    "PGD must be within 32-bit address space for 32-bit boot code");
>> +	params->cr3 = vm->mmu.pgd;
>> +	params->cr4 = cr4;
>> +	params->idtr.base = vm->arch.idt;
>> +	params->idtr.limit = kvm_get_default_idt_limit();
>> +	params->gdtr.base = vm->arch.gdt;
>
>         vm->arch.{idt,gdt} must also be 32-bit addressable here, just
>         like vm->mmu.pgd.
>

Something like this?

    TEST_ASSERT(params->gdtr.base < (1ULL << 32),
            "gdt must be within 32-bit address space for 32-bit boot code");


>> +	params->gdtr.limit = kvm_get_default_gdt_limit();
>> +
>> +	TEST_ASSERT(params->cr0 != 0, "cr0 should not be 0");
>> +	TEST_ASSERT(params->cr3 != 0, "cr3 should not be 0");
>> +	TEST_ASSERT(params->cr4 != 0, "cr4 should not be 0");
>> +	TEST_ASSERT(params->gdtr.base != 0, "gdt base address should not be 0");
>> +	TEST_ASSERT(params->idtr.base != 0, "idt base address should not be 0");
>
>         Making sure that cr0/cr4 are simply non-zero feels kind of odd
>         to me. And cr3/gdtr/idtr all came from memory allocators with
>         non-zero minimum addresses.
>

I guess I intended these to be sanity checks that the caller didn't
leave these unset (defaulting to 0), for an early warning to the
selftest writer if something went wrong. I'd prefer to keep something
that would retain this early warning for the writer.

What would you replace this with, to provide the early warning, or would
you rather just remove it?

>> +}
>> +
>>  static struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
>>  {
>>  	static struct kvm_tdx_capabilities *tdx_cap;
>>
>> --
>> 2.55.0.229.g6434b31f56-goog
>>
>>
