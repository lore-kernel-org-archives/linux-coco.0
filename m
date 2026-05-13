Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9185C4D9918
	for <linux-coco@lists.linux.dev>; Wed, 13 May 2026 16:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691030; cv=none; b=XbaGM0VEdI9GZ+D00oOF7vYYYWiKBmvUIsawRyMbj+5mN2CfPu2FBppuPEYe0dzpZxIkJKKsu2iXj2LZ7KpNWpaFDkbKCorgkMt2oQThPIDbSYB+x6Vax9y9/BDpzvogdc3ZrNVfj46nmd+1zB34slVaMkBysGaaFobe5321SuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691030; c=relaxed/simple;
	bh=mAqXdAIc20xRf2HYo20wY67GaSQLpUrRWs0gdd6mTP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ecZVt76e8DWNVBajpWeOG2nEaP4ozcODIFfTihqTFufAZP3KqSCoXkRZSmglH2YSKk93M6urjZ8bfDN8em9NUiaE3m6TYQfZiPgRM8LH9neJMwXEQBsGZ0cHlBXcQUc5z3i92+CCP6534Zye3hmt1O3Riznan/FS/TpxhVhwamY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LHzNjPnk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LHzNjPnk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778691020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YBT/cM1Lhi5LNZxdC5877fXBZx25Zuaoi+bmVCZ7rVk=;
	b=LHzNjPnknw5ozyB5nzbD0UZmYR/vG3V1YsqdEGD1Fm4AhboV9sOQZH2rZo0yLn2YCpb7hQ
	Q9UEbLP9yrfqRNK3e9kKi+ZOc/fV5BEJfRyK2L43PbYCao+upMLThDCkib/73YdfxImm0f
	PsFk/PN+dawxbuEgougxmb6H5WhGBz0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-582-3TJJpZwyMa2daLEVVLDe3g-1; Wed,
 13 May 2026 12:50:16 -0400
X-MC-Unique: 3TJJpZwyMa2daLEVVLDe3g-1
X-Mimecast-MFC-AGG-ID: 3TJJpZwyMa2daLEVVLDe3g_1778691015
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3A8CC195608B;
	Wed, 13 May 2026 16:50:15 +0000 (UTC)
Received: from [10.44.50.86] (unknown [10.44.50.86])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8C2CC30001BB;
	Wed, 13 May 2026 16:50:12 +0000 (UTC)
Message-ID: <2a655332-4ccb-4f24-a229-3a520047991b@redhat.com>
Date: Wed, 13 May 2026 18:50:10 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] KVM: x86: Reg cleanups / prep work for APX
To: Sean Christopherson <seanjc@google.com>, Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Chang S . Bae" <chang.seok.bae@intel.com>
References: <20260409224236.2021562-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20260409224236.2021562-1-seanjc@google.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: v-f74Ccl3zQgr_JMtCtziHXNv6-88B4dzygGVtIULX8_1778691015
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/26 00:42, Sean Christopherson wrote:
> Clean up KVM's register tracking and storage, primarily to prepare for landing
> APX, which expands the maximum number of GPRs from 16 to 32.

Applied to kvm/next, thanks.  Upon rereading the thread I honestly 
didn't see anything worth changing in the commit message of patch 1.

Paolo

> v2:
>   - Call out the RIP is effectively an "EX" reg too (in patch 2). [Paolo]
>   - Rework the available/dirty APIs to have an explicit "clear" operation
>     for available, and only a full "reset" for dirty. [Yosry, Paolo]
> 
> v1: https://lore.kernel.org/all/20260311003346.2626238-1-seanjc@google.com
> 
> Sean Christopherson (6):
>    KVM: x86: Add dedicated storage for guest RIP
>    KVM: x86: Drop the "EX" part of "EXREG" to avoid collision with APX
>    KVM: nVMX: Do a bitwise-AND of regs_avail when switching active VMCS
>    KVM: x86: Add wrapper APIs to reset dirty/available register masks
>    KVM: x86: Track available/dirty register masks as "unsigned long"
>      values
>    KVM: x86: Use a proper bitmap for tracking available/dirty registers
> 
>   arch/x86/include/asm/kvm_host.h | 32 +++++++++--------
>   arch/x86/kvm/kvm_cache_regs.h   | 62 +++++++++++++++++++++++----------
>   arch/x86/kvm/svm/sev.c          |  2 +-
>   arch/x86/kvm/svm/svm.c          | 16 ++++-----
>   arch/x86/kvm/svm/svm.h          |  2 +-
>   arch/x86/kvm/vmx/nested.c       | 10 +++---
>   arch/x86/kvm/vmx/tdx.c          | 36 +++++++++----------
>   arch/x86/kvm/vmx/vmx.c          | 52 +++++++++++++--------------
>   arch/x86/kvm/vmx/vmx.h          | 24 ++++++-------
>   arch/x86/kvm/x86.c              | 20 +++++------
>   10 files changed, 143 insertions(+), 113 deletions(-)
> 
> 
> base-commit: b89df297a47e641581ee67793592e5c6ae0428f4

