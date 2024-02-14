Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723B315B7
	for <linux-coco@lists.linux.dev>; Wed, 14 Feb 2024 08:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707899695; cv=none; b=RjZ1AISIye7BfHyqh5U6G3jrK/jyXbzRnF9Zmg77INtfvECsd28zFLUQtunsoLDj6zJbc2NRjTs/By64w7Fm3svj7lc20i1bovqlkodBPRHeW27iL4b00dwgJ4LCfA9oqK1Q/zCOxiPo+14HMvJKvQSgNcrBfIChgPkavGZ5EZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707899695; c=relaxed/simple;
	bh=PFn4wCJ4Kc9o4ZUF1udSybUYlNbwYhG9hFxqj59fXaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DkSVcEdqbLIqKMojWxGJbuTW3AoN4qzO+ptYSq6MSpp3T9/5O7+Oc2Dc05IqPpjzR+uxzxHuN6MD4QhtsCZGqJ/g6tZinpDLxbS5uqAI0oQk7w0ON/xRhCwdj3RavDMuUyhWgqnGcj0XBQEqgck/K/D2BSGd01SZM9UrfE0gDbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dIozZlWq; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dIozZlWq"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d1025717c7so24996011fa.2
        for <linux-coco@lists.linux.dev>; Wed, 14 Feb 2024 00:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707899691; x=1708504491; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uAiL2qOT91a69hH8+cvQmScbp9QK6BB+OUyGeu3FPlA=;
        b=dIozZlWqSstYkWQe3LPp68UN08xJqX/8/qNtubD/iSbk4+Enz5hFrdLtTbNZgs+veZ
         7jTaSh0GR2g4rWWq0D7TQNi9x8Q/r1T4XhaoRr6n0+9sE80WRseurM1ioSnynem7vTyg
         J72ogvW3jG7wvvWPmJXwx9TGJf3PdF4lQQQ2vsZ0+o9LSzxN8ZuZZc+CAjXBdm7/vi9D
         knUkWLWjvpq/iV3eQYMp36duKcN+QfbHglyvk5EpbnTCgWVW4rmTegvS8uDsR6MGqjw5
         quL4uDF5V/CIFjlRfQXJc7kxuFeo9+jtW0MeuSEzQkgnvCZb+q2HbwWDyzktx3MEYbDT
         hz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707899691; x=1708504491;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uAiL2qOT91a69hH8+cvQmScbp9QK6BB+OUyGeu3FPlA=;
        b=Pa5ourv77p2Eba5fLQw6lc0jVuuffJsi0MC9pxRvNOZSiT0MUljcWo7BxsEN0ljwJd
         BgCzjnrcFqeE/LnYn5bYKY261GcOj1Oku0rzhRC8FAeJ1fCHB/5HXsDTVJIzUOt2tZnI
         mZDVFU62bEO1RNt4t0cqhOvQ4dfVKBw19HBgkRZhkhW17Po5OhiGvSUS86gMsMX3PXZR
         5Ez/35C6k3Dgb32dQ50cOR1abBfZcvL/G1VjVHKSqeveaPXZf9qqsx846S6GcD2QFQhc
         FGNWRE5coVLrE79gfJgFR2yYPHhNkYfLHmanbx11w2WaYZnl41RhQgxlvV+LVuEXfLdL
         GjsA==
X-Forwarded-Encrypted: i=1; AJvYcCUBABj4X1/3sIEBsW92gCAaiF1JIPZppsCCpCwH3Zx4KdpbGwVIka4fN2y+Zftf5Mxk2u8TmGUOuUnD3ZRsaQqO7M1QC2SWRda+cg==
X-Gm-Message-State: AOJu0YwtSrR85SUWz2ut86Ek21z8IBLq3+26UdCjHQ2VL0bjMALTIrgm
	JKq9GoQlPE8IcMGppOAmU/sgoahZQRXBLVCzz4GQtt+hobKr5ySakNE7c97ZJMI=
X-Google-Smtp-Source: AGHT+IGNZP5/YY1RfF2lKO9BAAKxQ2ruwwCntxr2AxjDChypk993E72C6C2Q1/RyRnrut17odI30UA==
X-Received: by 2002:ac2:5b4c:0:b0:511:483b:91c6 with SMTP id i12-20020ac25b4c000000b00511483b91c6mr1203488lfp.48.1707899691455;
        Wed, 14 Feb 2024 00:34:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXpjEFtyIr/O2VfxqFT9HgCjHAO3qwMYeVKPbMBph5yslKlVHA6UCY8vGMWe8ahtRW4t5JMSBXcX/v7HbEq29cICxr1wVKHmy7P7F5jLrHkXhOhwjpNRkn2EegTPLy/zRMKhP8xv4R5uLMYGe9nS+lhGJAVvZMDSKYtjKsYwu04ZRFV28cqCNEtquI8ZJ+yYSKL33k9mGdESeuZzxr5HSw3p9r7ZHT+ShUL3jTOoKCwdjFJIDBXq48EMg7gmfjJW4rElDVSm1rncE020UL/a0CLn4xd7DoypvlwM+/nwsMtdXMzjAcH64efaTrgZsGWyuGNJZV3+jRhmkvYWUVKaDSZZYgQoFnpb7fkS662VyWMWEBpj5TNQcN5zo+lpFG7TwDgVYKt71nEnwyfvS9mUTEDqo6uNpBOc17UauW4HwN9mhSTtNHd26DfJjNnwsU3bo3Cx6x1hIO2dyqeeP1aGF9tIXjnVN+8RWTI03iazqY49oCM2yD84TCglRqKsCXa8/Iv2tM2V8iWbIeK041ML9PTBP8R3i4iSZFjygSZTsBTvdR8bOM14+R5OfU=
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [85.187.217.136])
        by smtp.gmail.com with ESMTPSA id s1-20020a056512214100b005115dc3a63fsm1598800lfr.135.2024.02.14.00.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 00:34:51 -0800 (PST)
Message-ID: <b786185e-fc57-4d4a-b0aa-741b92de0c5c@suse.com>
Date: Wed, 14 Feb 2024 10:34:48 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/random: Retry on RDSEED failure
Content-Language: en-US
To: Theodore Ts'o <tytso@mit.edu>, Dan Williams <dan.j.williams@intel.com>
Cc: "Reshetova, Elena" <elena.reshetova@intel.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, "Kalra, Ashish"
 <ashish.kalra@amd.com>, Sean Christopherson <seanjc@google.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CAHmME9oqM2a766dBK22-yKr8=2-icg=UkQzmBOF8G5Zh_Y9E9w@mail.gmail.com>
 <DM8PR11MB57505F657A8F08E15DC34673E7422@DM8PR11MB5750.namprd11.prod.outlook.com>
 <20240202153927.GA119530@mit.edu> <Zb4RlTzq_LV7AzsH@zx2c4.com>
 <CAHmME9owdbHzfb66xisoWmvWeT_-hkxCu7tR2=Rbye_ik1JgQQ@mail.gmail.com>
 <DM8PR11MB5750C1A848A9F1EF6BE66241E7482@DM8PR11MB5750.namprd11.prod.outlook.com>
 <20240212163236.GA444708@mit.edu>
 <65cb1a1fe2dda_29b1294e@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <20240213231341.GB394352@mit.edu>
 <65cc0ef2c7be_29b12948d@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <20240214043245.GC394352@mit.edu>
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <20240214043245.GC394352@mit.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 14.02.24 г. 6:32 ч., Theodore Ts'o wrote:
> On Tue, Feb 13, 2024 at 04:53:06PM -0800, Dan Williams wrote:
>>
>> Indeed it is. Typically when you have x86, riscv, arm, and s390 folks
>> all show up at a Linux Plumbers session [1] to talk about their approach
>> to handling a new platform paradigm, that is a decent indication that
>> the technology is more real than not. Point taken that it is not here
>> today, but it is also not multiple hardware generations away as the
>> Plumbers participation indicated.
> 
> My big concerns with TDISP which make me believe it may not be a
> silver bullet is that (a) it's hyper-complex (although to be fair
> Confidential Compute isn't exactly simple, and (b) it's one thing to
> digitally sign software so you know that it comes from a trusted
> source; but it's a **lot** harder to prove that hardware hasn't been
> tampered with --- a digital siganture can't tell you much about
> whether or not the hardware is in an as-built state coming from the
> factory --- this requires things like wrapping the device with
> resistive wire in multiple directions with a whetstone bridge to
> detect if the wire has gotten cut or shorted, then dunking the whole
> thing in epoxy, so that any attempt to tamper with the hardware will
> result it self-destructing (via a thermite charge or equivalent :-)

This really reminds me of the engineering that goes into the omnipresent 
POS terminals ate every store, since they store certificates from the 
card (Visa/Master) operators. So I wonder if at somepoint we'll have a 
pos-like device (by merit of its engineering) in every server....

> 
> Remember, the whole conceit of Confidential Compute is that you don't
> trust the cloud provider --- but if that entity controls the PCI cards
> installed in their servers, and and that entity has the ability to
> *modify* the PCI cards in the server, all of the digital signatures
> and fancy-schmancy TDISP complexity isn't necessarily going to save
> you.

Can't the same argument go for the CPU, though it's a lot more 
"integrated" into the silicong substrate, yet we somehow believe CoCo 
ascertains that a vm is running on trusted hardware? But ultimately the 
CPU is still a part that comes from the untrusted CSP.


<snip>
