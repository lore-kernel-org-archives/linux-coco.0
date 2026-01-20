Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6593DABE3
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 22:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768949571; cv=none; b=JlUyAF2UQopzzdVejxTtoJ94BrJUWGcch1nHc28wkz8OPM8Pv6RIMO+r2faxdYfEXOXikwPkT/+VQIrRAW2k2NBc2Tj8opUQbIanYw55nMTkrCSFin7f4J0BVE8LlOY9KVV3r4NyK0IYxBIbIN6CEXPjW3Givhqny1yXnO1XtZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768949571; c=relaxed/simple;
	bh=YlrGRNqn6JFQ7UqTzoYJGtRpZG/++k3eSqoLSQjAtjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FCjATE7aLCtF0+aDR54QBNUwMDPEe6BuN6X83ynX4rKizT6iTKhxu/qdg/PvmAts5qMDCENf/8PvDQmCgS8Iip4CEepBG7Ez7KWsUCmEzhrNAEAXmGBaKz5Hcnu0k/wq2BiKT78JCFfyz5wCEMDD6BPGBEpvEYKcv0spHmAuuAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=hn/p2FW5; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="hn/p2FW5"
Received: from [IPV6:2601:646:8081:9483:12c5:bc8e:d949:3497] ([IPv6:2601:646:8081:9483:12c5:bc8e:d949:3497])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60KMq0UL028191
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 20 Jan 2026 14:52:19 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60KMq0UL028191
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1768949541;
	bh=itEvO9NTkRKdcDBVmsGTQ10ed+2VXZXOIeePmG8vwUw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hn/p2FW5CqJthD1w7Xs+DvwedshxR1at2AdhrRu45u2TXCpb2YklfiM9R2lYD2B/N
	 w7ClUzHcGJjLR8pnHodMWYKZYoVF7DqN7mt3aNlvApU1om3refPkgf6PCnB4If3b4Z
	 dIUkVM3R0XWCVEfA+EmHESMelAUXYITQP1+rj7cn/KMY0BSWT+xjNniTg8UT7nDx3o
	 3NgyT1CY+agcD6siZvh2ihiSlvmhrFn7SVSzwDXRAVR+1Oe/aYqz5is2hB2SS0fySU
	 oMC9LE3zwJzSGmc0IjbqkeV7dIskwh+Z2JqAYoqIQdpLl3uq/O7CbTKww8Uy9B7Oyx
	 9ju3tfPga9Ajg==
Message-ID: <dec1687a-a70d-48cb-806b-0320de7f96f1@zytor.com>
Date: Tue, 20 Jan 2026 14:51:50 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/14] x86/realmode: make %gs == 0 an invariant
To: David Laight <david.laight.linux@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Uros Bizjak <ubizjak@gmail.com>, Petr Mladek <pmladek@suse.com>,
        Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Kiryl Shutsemau <kas@kernel.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
        x86@kernel.org
References: <20260119192923.651588-1-hpa@zytor.com>
 <20260120195407.1163051-1-hpa@zytor.com>
 <20260120195407.1163051-3-hpa@zytor.com> <20260120224014.29e7f326@pumpkin>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260120224014.29e7f326@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-01-20 14:40, David Laight wrote:
> 
> Would it be better to wrap that as (say) read_abs_32() since the
> objective is to read an absolute address (using the relevant zero segment
> register) rather than to read though either fs or gs.
> 
> Is this code all running in 32bit linear mode with non-zero cs/ss/ds
> segment registers and 'suitable' entries in the GDT?
> That mode makes my brain hurt :-)
> Or is there a fudge to get 16bit asm from the C.
> 

The code is running in 16-bit real mode, compiled using -m16.

	-hpa

