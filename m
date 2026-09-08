Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D1756C634
	for <linux-coco@lists.linux.dev>; Tue,  8 Sep 2026 19:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894376; cv=pass; b=FEsJBHzIJ12Fb4nArHrg2MEd89yJyDIMa7jmhVj3TxDJ117bZc5+zZ2nT2vKOxh04q94qy15QnYxPtX36bwi5k3AAmELhagZv4iDH4WPtDtO4jQ3L0u2D1lANeoeskQxsvhqBLKq+BwvcM+J9jQzqDIp7QeMt18PI/LDH8GQsL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894376; c=relaxed/simple;
	bh=JxAv9A35o8tRcwxKjZO94SBS9xDo9RgjGVk4mfstMJQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m082W5D3cqktyPubtPvZXQyzrqFkCD18Xq3I81wL0EM0i6G4oaweN0uCzg+9/orXNV6e2verZPDcqLfaTB7+QJhgapi+Qj1F+Q2umwn2IvckJB3lc47EL7O8ySzZtnuncgNh/zGUSVteWhwzjPBVaIRsJpO19UvKouG1CCMmwGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=od1y/m4v; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="od1y/m4v"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-85a50f6a7f7so69377887b3.2
        for <linux-coco@lists.linux.dev>; Tue, 08 Sep 2026 12:06:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788894374; cv=none;
        d=google.com; s=arc-20260327;
        b=bTjcUds0sfORiCKVBH9cGSF/VBxw3gds59gSEC7PUrbHsKw+4AFB8GWy4Uos0r/GuR
         u3ufh/LzILMQmtMInPFYNhrRtk92O2PBGGWmHd6dLyBn0a2nnyvgvhdJjED2Bu3VXZxj
         w8K91JjVZ7FfwMfzAjaGU3ynSK8h4F9sjTAZrJRbxBQN9Za4C9wj61x0YDVTnKSbiaeJ
         yS+Tf4KoebnuDkqNTtSpO3yPjS/1kae0QFZhWNeuuSTDp1MBV6JB58sopdzwTOpzl6Q3
         ww2Hp65wqLTMqK00/adKPWFIuDOudo+enopTLHNzqn1xzrVru8diO0+GQuv37EoB9okf
         +gUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=hhSMn73HXnZUeqqhpj5wjt1oII0fZ8bLb8+fuULddR0=;
        fh=0aHgiLn4+lp05szV2ltsnmssujOsSots6QqL72EluJI=;
        b=eC4SPtqx+igzGDRLszy4KytxP1eOjdJq3L1SfF0nGxYB3U5xDR2P8awMKhZGE92xRK
         HR2PGmstj6HW4heyT0IpAu77QcldWisvExiPPURUKRPNXW8LW/QnRKszqpW9xtwZ+eDT
         VpLOwxX1txzcmBAXNFDF7JcqpO4md2GUdqXB3hZYvMGFGGl8t2S7shIGryvbodTqxHZ+
         i+I5tXxS6zYMlQuOMIFoO0lpkizHZ1dBKYLQjy1g/rGEQuZ3OmC0ZnPlTWHs1xLCfEuF
         g01QFns0yIc/k7wOJL+RtEfOphkTrsdq4oK41h0HB1TJXLV4MeSSlANM0wKb4JEEq4SR
         v33Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788894374; x=1789499174; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hhSMn73HXnZUeqqhpj5wjt1oII0fZ8bLb8+fuULddR0=;
        b=od1y/m4vWdUY2qRaCbSxsmk2f1WZIn9bpGPqNh94xN5ftt4rA/5ICXqdRywYWTFK4a
         sLgW2BDjjaIVEbiXavpiSV925VRjCznv1zlNcvhJ216Ei8nQAc6fUnneT13vlRW51Sj8
         p239aEnP/YQp13OuOgeLc7/mkRXm+/UsKXHxqX3bz938oPcC7h739VppGDILqR6/eCeh
         FNKvRRaGEe0KrK9AWrlhwmXVDX7yBLHeIExFQqBVi26VZvbMGQouXE3l9dcWTjg5qZUR
         lKY8f2B+m0fMyuhzcz3fQt43uMeCLXGTD/nVqDxo0G05CFyNzI1sIj48uzRAzF32skwM
         8fkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894374; x=1789499174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhSMn73HXnZUeqqhpj5wjt1oII0fZ8bLb8+fuULddR0=;
        b=saR1q5fJSH3Y0p8WfYUvd+JnHaphZb9hxhHu+XnBT5S5Dxw5Q600E6HPELXZt+jxjc
         tyxzkUN1px1b/FtbnnZag06f+nhisiMCWNNJZw295FQo9MTaNKJnUM747izQLF4Mw9fI
         0HNTZj/ICH4Kp9DVU7gZ17waQ7kMUEbwr5luRpiINC0+/KFAMbDv36u0+w5Hg1HcwR0U
         HQpgDoI8q9UlG2EAGjGHr5UosaVkj/WnQP6mqm0EexeZiQAc1MOwQdZ+6Z53FcpO9qyb
         PUbqgB59GTrFBwZ8IkYgei8xG5JrWeqUqG1FHAH1Yu7h7lpdjC4Sh1e5+w/XXbQI2w/5
         B9pg==
X-Forwarded-Encrypted: i=1; AKwUvByfWJ5X/EJtvq4iAsn9qFgaF7vyrZdH0Sm1ZrboBhW8VAyo4mcgtjTnHe1eMnKopjXV/MuyEc0XjEtN@lists.linux.dev
X-Gm-Message-State: AFuF++lWHtWFlVilYrffC+pKR6s2csqubaRgwQfdQOLk0caEBPHaoomq
	fdgjniS5x11DvzSO1RQddii1+YZTOL71xX/61Lq1Ptn+txtvYhz12GzQna8WoODHYzA5aldHMsA
	fPjx7GZWOjdS73qiAZ5dX7cFrbQcg8hM4kcRfLwtF
X-Gm-Gg: AYBFou2IgxaDrATBK8OZDuAz0qGlPp9LQXidsjg3tF0Jl/PwZsQ/c3fry/AqZ4VrIMS
	HaNXF8wTnYWqwTAj88u6MsOT3UjIxDDLY1UNvqxRfk6dNa746A42QpkQBbiZz9dexI+t4L+bqUk
	EouKiBLOVnmMcqb9C9GyEbr0wMDaeUe+S4W/czdkd4NaBPf5hmd87voVvFZx01A+aU+UVC3ZPlC
	+2a5I/ng2dVH7tjQiD2+vbCMBYvABh66tAqNp08ffMIlt85ueMyeeOmFQAhzkz+KrbZuwWuhurc
	vE5kgqGe8XDGCjiV8bkz1LP0CLmzZQVdcUarxlyLS/yyq9oPR6kiOYN9xaCv35IkbiEIJ73noQz
	xUBvYdANSBcGzCOgMcpybQeLXWR1bc4vhcGrEVkC0EA==
X-Received: by 2002:a05:690e:4143:b0:668:42d:95e5 with SMTP id
 956f58d0204a3-66fb58f1410mr10675130d50.4.1788894372039; Tue, 08 Sep 2026
 12:06:12 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:06:11 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:06:11 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ae783977c1eaa34d2910f76dac1437c7aad47d93.camel@intel.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-4-15ad654a50db@google.com> <ae783977c1eaa34d2910f76dac1437c7aad47d93.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 12:06:11 -0700
X-Gm-Features: AcwNN1XsGt_fUaARpEZcGvQCOF1lLG5Qg2IcdgK2WB2r0fv2QH8UPnIsl3MEqiA
Message-ID: <CAEvNRgHB9Vhwe4kOGYUn3piw3dw8zqSgVQX2VonoWCYPw-TaWA@mail.gmail.com>
Subject: Re: [PATCH v14 04/22] KVM: selftests: TDX: Use KVM_TDX_CAPABILITIES
 to validate TDs' attribute configuration
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Aktas, Erdem" <erdemaktas@google.com>, 
	"Li, Xiaoyao" <xiaoyao.li@intel.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "afranji@google.com" <afranji@google.com>, 
	"kas@kernel.org" <kas@kernel.org>, "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ira.weiny@intel.com" <ira.weiny@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"Chatre, Reinette" <reinette.chatre@intel.com>, 
	"isaku.yamahata@intel.com" <isaku.yamahata@intel.com>, "seanjc@google.com" <seanjc@google.com>, 
	"pratikrajesh.sampat@amd.com" <pratikrajesh.sampat@amd.com>, "oupton@kernel.org" <oupton@kernel.org>, 
	"wyihan@google.com" <wyihan@google.com>, "sagis@google.com" <sagis@google.com>, "Gao, Chao" <chao.gao@intel.com>, 
	"Wang, Roger" <runanwang@google.com>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>, "Qiang, Chenyi" <chenyi.qiang@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "jmcrey@google.com" <jmcrey@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

"Edgecombe, Rick P" <rick.p.edgecombe@intel.com> writes:

> On Wed, 2026-07-22 at 23:13 +0000, Lisa Wang wrote:
>> +static void tdx_check_attributes(struct kvm_vm *vm, u64 attributes)
>> +{
>> +	struct kvm_tdx_capabilities *tdx_cap;
>> +
>> +	tdx_cap =3D tdx_read_capabilities(vm);
>> +
>> +	/* Make sure all the attributes are reported as supported */
>> +	TEST_ASSERT_EQ(attributes & tdx_cap->supported_attrs, attributes);
>
> I think this patch actually does nothing because attributes is passed in =
as 0?
> So 0 & supported =3D=3D 0. It does exercise KVM_TDX_CAPABILITIES as claim=
ed, but so
> does tdx_filter_cpuid(). So for a minimal support, we could probably drop=
 this
> patch.
>

For more context, Isaku suggested this in [1], but after all the changes
tdx_read_capabilities() is already used in the tdx_init_vm() so I think
we're good to drop this patch.

[1] https://lore.kernel.org/all/20220901012853.GF2711697@ls.amr.corp.intel.=
com/
>> +}
>> +
>> =C2=A0void tdx_init_vm(struct kvm_vm *vm, u64 attributes)
>> =C2=A0{
>> =C2=A0	struct kvm_tdx_init_vm *init_vm;
>> @@ -112,6 +122,8 @@ void tdx_init_vm(struct kvm_vm *vm, u64 attributes)
>> =C2=A0	memcpy(&init_vm->cpuid, cpuid, kvm_cpuid2_size(cpuid->nent));
>> =C2=A0	free(cpuid);
>>
>> +	tdx_check_attributes(vm, attributes);
>> +
>> =C2=A0	init_vm->attributes =3D attributes;
>>
>> =C2=A0	tdx_vm_ioctl(vm, KVM_TDX_INIT_VM, 0, init_vm);
