Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647157;
	b=rA1Ssw07HEwsNp1HYcy+ywgAU0joPfqTO7jzayWc7VtS5zo4ofHh+SxXn/9PvrrrChgi
	 2owSYOXrukFv/89QbHCTOxckqhVp1s36JF1rQZOmwBC/28LrbmtHbkwHGv/xNbMJHswV2
	 7N5ckVxHdFbExm0O5eSw1FYUEdxGB/HqplIKQmz8XRogwlV2wF4tF+EaGlBQEu+wFRNO8
	 qlcqQ9SpsD56do7NptOlnmi546JD5rI7mLoSAzBIU9OsbNAwehChcBRT0HvkdugPjCD44
	 ihWnduE93qFNs1cbxNrJghjva4DM1RuaeXXJx28CSVOHwZHmXsy01zPU3QOOTDs+8Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=OC/gY15cLyDwevMNUFIaNM4tFLtXDK4Xhw0hL/Ej86M=;
	b=3f/mKPDCG39FhHJW1r7IEodA2AQ727ZY3uk0B6eaylgdD+eD4YBlR/AE3zN2JP1nsvcj
	 MbDX7IBZrPSTTzFe8kGrxZwWc2qbOxSRKnoGJOzjhseSkWUIccCbxbCeR5eeM0XleeVJ/
	 +D+U/qDnUlD8pK2KJZnkywvUA122jIp1A3WbtWtqciBi5p2MP7J+XAXHHtFaP/VycJpst
	 M3rO2ZohunBAtXbqN6OVqwCH2NzNyzPPtB23GwGMxIf2QznJi2vqmd5DGIMMMUD8FlaTR
	 bS+Htn9elU7M5B1nNaQJ27LCL3LSeIX0ByUgs2/f/j5v19Nq2PJojPg7lZnA2+oTQsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=iNnEgD54;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE410606A324
	for <linux-coco@lists.linux.dev>; Mon,  2 Nov 2026 19:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE410606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=iNnEgD54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1710332f8f.0
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 11:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793647155; x=1794251955; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OC/gY15cLyDwevMNUFIaNM4tFLtXDK4Xhw0hL/Ej86M=;
        b=iNnEgD54/agKvVpKVvV+hrn+egWpRdz/hN7UgYNDlZ0J1PrlPG+M77ppy4QfqOvQFH
         KF4f9KEoshwTgHi7NNKtJCXvLkxIjrKYSf0nt4nMalHfiNKDXSR/kmNQFY0I/TdEVymO
         ZQZQVSMGACJdLu50yi5rEu7N8HGAue5P26KT1Jqg71sQ85OqT1Dl7K1ZoMSsZk36AU7D
         +PiULwFqJxOU/ppqyhbV0qOI6ZenzApzZsU4B6T6VcvJzlfkeNvojRo+mjY/m9StY8Cz
         Sh11lFF/7ldq1WvWm4TuQI08UDqHlmt39RE99RJaUo9JLxD1K/eaAJ2ozvkYiWFEEQ84
         9YGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793647155; x=1794251955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OC/gY15cLyDwevMNUFIaNM4tFLtXDK4Xhw0hL/Ej86M=;
        b=oLm9xSWLL9cuaeFlHDv73MS6PTDfx9NG775WCCJUDGxv98IFPreFmF88zKfH+Ximz9
         4SABTyIxaFaMU8Ims2U+FKwaPpVG3d/W5rJQ11O/Y0PMnZevlD+/B2KAg7p9SbGkWheC
         RVsvuZ1amXfyi92Yu07dup+L4mtAWmM9HcDyl2nJamuWaHfOssReu+yXNlt7VvD94QYN
         BbORNRl0C6dR0cym1muQHfzk1beKGND9upcYvQ4rSLLQaWN+PJhzaxJaZq+2VNu4GwMI
         Jb4kLVdqTTaUZL8G9HdHyCkEJVmjCFEkWjvgjgURskURezndgcAYQ/Y92Gqp/wmVSARt
         X5dA==
X-Gm-Message-State: AFq9FYL3VJ1GKaKVBw18vS4vVh/FJCaO7bSpVedc1BmMcfzOvu2v0rOK
	w43W+irzUpEtI0LfECBkpIxvVIpWQ4F9WWxUbhMh5kyAuCQEV68mUrPbPJnfL8ok8P4=
X-Gm-Gg: AYBFou0gHK4r/UhAWnCGUVZDRdo1D0jGJjzP7kyiUWaxKP4RbjlzCY21fDly1yVqZ25
	+yW/r68H0rnmuEp5Wcy9OGY2RijvgDfHHFhMl/ThJN5wROcIBw4SxNAyPZSHxFV8+bj0uqAykso
	frl7s+I+eT7Zzeq1PjA3Ap4UHMwAZERBFh5u5AaEPFYxke/UEERUbM9i9znqI3mlC9t+taxUGOJ
	XGzBEeGK4T6fSsqvhndjgw16LzThtdEKheFlGKTpCgj4T8PCVkvJZhI7eSr894IhZ5blf/4xN7b
	GQDFtMUCQ1jhubB98n2kaips2txfwi3MBqQpGkA/H+tjNRoRlhjrkZQrPZx7iShnIdBzcavDTeM
	Ypq/0s6m9sTpmE6ifUESLRZSS8600jQooM9KBuLxWYS507p6wyizFAnMWOcZUKfjwp+bgD7kA2v
	A3qWP/ZJYiPhNPhnxTE7nshyt5lZjdIl+D80VU/4yICeZfGMZ9HlgWrGrPe5pD+yUTdoXanFM9K
	Lk2wO2m2NZmPjdWOTM870CnImWwDQ34jl97uimhzrNNn6+wlwVewMxpIFiYATi95ZbC2wlki2i0
	zdtmnQmhoeYtLNWrznz9mET2B9saEwzhF0R8obPIeLONRxof0FR94KzIB8hQ
X-Received: by 2002:a05:600c:6989:b0:4a7:6425:c274 with SMTP id 5b1f17b1804b1-4ac150b38d0mr251477715e9.2.1793647154958;
        Mon, 02 Nov 2026 11:19:14 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aae24b32sm6083675e9.12.2026.11.02.11.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:19:14 -0800 (PST)
Date: Mon, 2 Nov 2026 20:19:11 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 08/20] ctlv: Prepare message output handling
Message-ID: <aujiKOR-JR9kTMia@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-9-jiri@resnulli.us>
 <179302367451.58760.3909701518454079333.b4-review@b4>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179302367451.58760.3909701518454079333.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> [ ... 498 lines skipped ... ]
>> +/**
>> + * ctlv_op_query_done - Complete the last query fragment.
>> + * @ctx: query operation context
>> + * @generation: current data generation
>> + *
>> + * Return: 0, or a negative error.
>> + */
>> +int ctlv_op_query_done(struct ctlv_op_ctx *ctx, u64 generation);
>
>Typical kernel style has kdocs in the C files along side the function
>body not the header file

Okay.
