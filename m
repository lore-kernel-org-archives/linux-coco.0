Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17290513562
	for <linux-coco@lists.linux.dev>; Tue,  8 Sep 2026 23:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788909883; cv=pass; b=sD7rplF/2WWQ3FFF1GT00FXuiGl3yatpulwsjTk5guDM1UohSmRmSXiTsM5v6N12Zzbg7Ar2kjHZlRq7/bHBOwaEXLW82j14hzldPdCfY+Rfdg8xUReFLfAGAz0cdO4s/AjrsYHjgYOIHvnOYIsqKqh9zOgWdfx3EIrI3dsqUIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788909883; c=relaxed/simple;
	bh=BUX/j6GF6XPucpJCZBKJcMPFmpJb+KNmwo1Z/5+yXsg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H2SDl0tsJi4qzfqRc4CLWeFPjFlZF2YcJV4DRpwX/0woRi7Mmx2hZPfTd9ismQJZvz08S+vB7GoVYTHNHCYQbamBiM7yz89HtE9bMcEaiMXuD4Yks4OTgYJCwmdQaLrAor4CrwM/H3a8cFrPPYMIoExoOQe180tbUQuT780as+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CIymhJQ8; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CIymhJQ8"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfbd148aso5154486d6.2
        for <linux-coco@lists.linux.dev>; Tue, 08 Sep 2026 16:24:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788909880; cv=none;
        d=google.com; s=arc-20260327;
        b=DlLRaOa7uAsBxsioPZC+qjGboouPjAaO97MnO/KHGrToI7GolK9dW3IpJKaiQ9EuGw
         kOZGUNDdT60iGl8QSfJOw0e+ModoYTsXIHdH4JiAH6nDBAIpSaZxqQQwFbBJnDzvg4WO
         lniEJaSad2TBb1kQXIK2o7I6zhcKY0AOn4c/a6eAw7rsyuAhFo+M2EAVqa6Zrr9pzfbk
         6BPr2QKAowjy8nfZWMjh8pBv3nrAH57pYoTYqh/WnlAI4sKNEusTQwjahxZu74IpCM/K
         KMLviqqATiptQnMjBTQflmIPDcjLvD+z49Bv5fSQyk079eiDZure5bHxqkuTMNaM4tI2
         Msrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=0IN5QQmb/lTANWR/iwoSBOuy02Mh22swkqv8V9Ybn/0=;
        fh=djTOoiGKwUNiL4G/wukaQxheK6Uam4hZJ6if3x7mnoY=;
        b=Yur3DP4gmGlMSHiHEz7keCDVZ0bUA1P/Xhy11l0dNQwMl8AsT+MaO6jsC+sqQPAk9r
         Tn0fVt6WmflTy4tcxl0y85wg/EUHGYQVSwoOkTjq0mCWiiPP/r4gBsiY47zo4faN9sFc
         KKV3HOMQLXU6orXm2lTmTGMhNRPVmKv3BtB5scxUCiw0/5CeYNeDSL0hvL6RG1Hioqj7
         YgenStvdU4lnjfqvlnmYviJ0V6Jr60fjvuuO8o5rESZI6EjjzQ9Pc2JctFr1bO+dMT7j
         xkV8pPCM8VW/1iBsqFRJTlaCZvB2uhByqQfP0leX9jTLmHyOypXEdqpHn3jh4cJlckaw
         h4Zg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788909880; x=1789514680; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0IN5QQmb/lTANWR/iwoSBOuy02Mh22swkqv8V9Ybn/0=;
        b=CIymhJQ8JhoUmKbhv2nKSRFWqN/o75cy+K/p+sXvNdHlNDrebqoxU0yCEzIzWuR9X2
         Z7d+BHI5eAxLQbH/B3NH5yFu8bGKJRTuQMDCfguDQ+eF/3nXd+B9lNcCRomT1uOyiTrZ
         cgiBRGNcYoWqm9CWENZvwd4eN5wwj7hfULrGTFKDV7WNCZXJ4sQacuHMRL6ubl2qFno4
         LfYPVM2V8u8KR/NyShQNhBeFxjgYkRCuBTRxvnm9nVMKmpjwLN2rT9lPW5uFYdETOD11
         /1kYDVjmDL7pW0DKl1DfZVpikDsun7c/M3SMmbB7nTxCmxw0pN6gLId+A9P4kCZUzYVS
         1vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788909880; x=1789514680;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0IN5QQmb/lTANWR/iwoSBOuy02Mh22swkqv8V9Ybn/0=;
        b=GpqHASTc9F2Nh2oyaay9bj0foMNmGCJh7BsIlyf8L1YB7IpUErzZHAsdJTVh/el0l/
         n29GgIGi+nDZZigfroMFh5tU6kdmHLAoD52Kbq41gS0QKLkQQtC8Kvx3nBuntu0X/IDI
         t7NBJKtaOor+S4VvrrOQtSl4rFxBRhHjnYhGRwED7Rk446pQv/Ih2xGGOwevu5ofJvl6
         GtdaXFbRLVz3wO9WVQjTI5LVEASGKMsddWxZ9hsVYng1TN+kiFZlYjzcw++1XVYCuNkL
         W90f+BmAb5M8Gz8o4GbRMsd3DKmg7ewMNVI8ONGBN3R7p7ZNTuQ1Q7zR1l18+9C3GRkP
         YGug==
X-Forwarded-Encrypted: i=1; AKwUvByLTC3OxMOABThgQVGTpdi53fwIMMJ2LWAA30+V6MdQEwKwshsbpWrDFhMf96y8xwrP/T5JzK+dEcMx@lists.linux.dev
X-Gm-Message-State: AFuF++knDh0Dqh577ULtbt+QuyPGLKbTWd/j6DtGHcdnyNHtgIs1KATV
	B88XbOPvnxT5v5p+4OR6izHiM8Xjv6UUwbQjaTf7EC4es6/YKrTdIUe5oviPK/FuGFrJVKNI/g1
	7uEnG/0hYnv7G58fcV7y2cgcCcIku7uzYE8zJykos
X-Gm-Gg: AYBFou04pqN3+K5mdvIiz8XjUJ4e8dULUluaIoB1CJMyG1M+YMrPgpGHVP3r57dYYKa
	Ral7x2Hpe6CXIgtyTMIdRaHI7KImbIGHFuU3yfrM6pSKyoaomgPQblzkbKZaKI02hcShB6fYrAz
	bmWYDWLLhdnguCVsM9jte7cd3N9TnFU1Z6dy8Zi9UfloN6g3VEGCBZBUQbSxVU6YEKPhSapbs9w
	RrRLY7pkSVm7brwEdoNKd6szjWfCSMo3riwGdZZW1Q//PYc0nn8z48mhswRdEAKCPUmIqAxwHm1
	3DZx8pBmD52AFgVRRusadCG0lqHd/PS2azWiaUx12k1rf62xCgy837GphEhs2oUvEhOjjSJoPh5
	wtIV+blPsX8+T33e2fYwRLplfsD78pgc=
X-Received: by 2002:a05:6214:4a09:b0:90e:7de2:d81f with SMTP id
 6a1803df08f44-9106b407918mr47732286d6.20.1788909879267; Tue, 08 Sep 2026
 16:24:39 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 16:24:38 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 16:24:38 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <0a08eab7-e093-46ef-97bc-531766cdbcf2@intel.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-19-15ad654a50db@google.com> <0a08eab7-e093-46ef-97bc-531766cdbcf2@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 16:24:38 -0700
X-Gm-Features: AcwNN1UULNTPjF9-p9AmAvuYgtyt3ObShfxcFD10uTDSDoS21CnWX7JfXOpZMy0
Message-ID: <CAEvNRgHE-c09hdeLqkUfGdnrAUkENuSrdNqByXBYr3N=HSbB_A@mail.gmail.com>
Subject: Re: [PATCH v14 19/22] KVM: selftests: Finalize TD memory as part of kvm_arch_vm_finalize_vcpus
To: Xiaoyao Li <xiaoyao.li@intel.com>, Lisa Wang <wyihan@google.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Chao Gao <chao.gao@intel.com>, Chenyi Qiang <chenyi.qiang@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Erdem Aktas <erdemaktas@google.com>, 
	Ira Weiny <ira.weiny@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>, 
	Sagi Shahar <sagis@google.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 7/23/2026 7:13 AM, Lisa Wang wrote:
>> From: Sagi Shahar <sagis@google.com>
>>
>> Finalize TDX VM after creation to make it runnable.
>
> The changelog is too weak.
>

Some other points I can think of (Xiaoyao, please add on!):

+ Why was kvm_arch_vm_finalize_vcpus() was picked as the lifecycle hook
  in which to finalize the VM? (See comments from the earlier revision
  from Sean) What are the rejected alternatives?
+ Expand on "make it runnable": finalizing also performs measurements

Just confirming: Peter, you meant to add the () at the end of
kvm_arch_vm_finalize_vcpus in the commit subject, right?

>>
>> Signed-off-by: Sagi Shahar <sagis@google.com>
>> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
>> Signed-off-by: Lisa Wang <wyihan@google.com>
>> ---
>>   tools/testing/selftests/kvm/lib/x86/processor.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
>> index 4b97a9a1bb5e..8319ae3d9fe6 100644
>> --- a/tools/testing/selftests/kvm/lib/x86/processor.c
>> +++ b/tools/testing/selftests/kvm/lib/x86/processor.c
>> @@ -1489,6 +1489,12 @@ bool kvm_arch_has_default_irqchip(void)
>>   	return true;
>>   }
>>
>> +void kvm_arch_vm_finalize_vcpus(struct kvm_vm *vm)
>> +{
>> +	if (is_tdx_vm(vm))
>> +		tdx_vm_finalize(vm);
>> +}
>> +
>>   void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, u64 smram_gpa,
>>   		 const void *smi_handler, size_t handler_size)
>>   {
>>
