Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199F8412C0C
	for <linux-coco@lists.linux.dev>; Thu, 23 Jul 2026 09:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797233; cv=none; b=clyke2+aEiSyaTwfOjnhDkOku1yvrRhA7DQN16kDdL3xM7eMIvmZ+k3qorwWr1Yr5RhaCLz1SVVJJyJUCt3EWjJJr8O25YYtkA30Z5nhXUN2wX+9bF/t4+p3UPZrGkc8u9vf8vt0uNZ9V82GUFw6LiSExjIlOlZ5eg0sSnUqXVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797233; c=relaxed/simple;
	bh=b+Yb+gLLuIShvdQZVzyZyQXKtf9BQGTmB9hGa4ULn/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kFSHodCERjCv/sdYtPeS/6GRWf3xH3zHcRWMTVC02FMYzj/sONq/4BlKNq8cS4d4eV9Wr9mK5Y6qwCEPajT3lNAftWZ/56/oA6kYhI8gICMJVP2keyK5OtanR8/1PgwHpMQ8lk91Wd3CkIex8Qenq921wrefoaIKxnCEVSxOW84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NI7deJen; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NI7deJen"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so253435f8f.2
        for <linux-coco@lists.linux.dev>; Thu, 23 Jul 2026 02:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784797225; x=1785402025; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uehkej/+3IvHOknJ9E8G9NfClRJBiDQG1DcA76gXgp0=;
        b=NI7deJenHueBYcOCYEskN9wS3j6O49dacm1aZGHKf2UPzXpct9KpQ0ywTUfCT+3bV+
         cbtpefyk6Y2joJHUZWdNNUA0ruOzVd2Aoei1qRC54F5TcdNgioBsD8Yb/u/CC3+jjh5v
         QJP1tePbepKIijJN7YhpBt+gnG7pf2u06OW9d8Qei5vzBZFhZZfWjiJvk5m3zD/29wIP
         PnANhSBwcw7e8OtAnFcbuQ33Z90sMIsYVn+vaXulaWmLewOA/HTKisRLvSAB+owQ6YH+
         +b4nlo/VrudYkX1j8rTDWMjoDyEco+uOQjJMSd+SSEa8xGM/ZbI5mmiDx/rA4aJd4pFw
         fo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784797225; x=1785402025;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uehkej/+3IvHOknJ9E8G9NfClRJBiDQG1DcA76gXgp0=;
        b=AwXB4O271s/2zJK7s9cwcMwrtcVUhjvL57pE8FcCzlWPIqtHju6JWp6ON67A12cAIo
         B7VCrumz02DpEpHIAziMTS0gklajY0qCTSp+mC/pVgjafSk2dsXgTTW4n1bpn1d5Sen8
         GfWdHVy8FswCrsNBSzIvhS3ddubUa/lXwWEJikUXkOBBElkzTPq0Hk6pmyhvKNwHvqIO
         tuKddWm78NU6Pq769i5E/unKJsgdOeWfTnrFDb6C7Ffiaa4jI9rMeh1SqJ1zyact0iVA
         i2WHrLesIv/Hv5aEeaNqoPWnf88Tcd5O0qEv4xc7ilANBpJ0BeP+GfK9Wk5wM9fYGG7T
         iGig==
X-Forwarded-Encrypted: i=1; AHgh+RrEcR5GkbbZfFm9UGXqSpSKSViZo9w4FIUw/fPm2D1gzK8PG/TIhOMoms9C9EqnSdn5HoXFWHE1botz@lists.linux.dev
X-Gm-Message-State: AOJu0YzFmJM8i64DrSFZd6aEyHPgblxqvSdZkZT9teUp4zU3JVWX/vvS
	7hHC4wpmKlodM/V581wZE+fnsPxI4PUAHNoQ1eAa1fN4Z1m5omt0bGleiNEakEhgy/k=
X-Gm-Gg: AR+sD130T/6wya4eFBxMJ1zzdL9sIJbqZBT1flMFMfYhlyM8J2Mvs1m/F3gG31AKWew
	ndyH0bDFRIrab9AawbuPJBGTU3BsqdCfM85HbtWdXYxz58vEbD9hrpXJFY8Sca7bfLJANqMmRja
	D4+d8ARlHOZagFKK2Bl6vE9kvNGI5jTRYkUlxIGGHZ+dp5uEK2XSqfSYpoCP6G4C424Jod5P9RH
	hnE18rfmv0U9Tnt0evx+yzWQsvkb4jDDKlD2Qf7fUdsgI6mXdwjNjEjD1ppm6f8JLljzaIKWdyP
	wdMZXnHfJgvBhAUEWf70Pi+8vAHaZcFx4zDByr8kXzJD/VsfGh7LdXd4zAUkItVoZP62ZinLtuc
	8SATEmVtxsNzfNuD+SBskfysISQKZ/hFXkZvwk/60ZtEiBv6PoeqFk6qnQnhMyWB+f5TUsy5NnE
	uRT0N56CGMaEkMF/I=
X-Received: by 2002:a05:6000:4203:b0:47f:7b75:61a with SMTP id ffacd0b85a97d-47f8d71f494mr2735264f8f.15.1784797225474;
        Thu, 23 Jul 2026 02:00:25 -0700 (PDT)
Received: from [10.20.4.146] ([149.62.206.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6d277sm14123850f8f.32.2026.07.23.02.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 02:00:24 -0700 (PDT)
Message-ID: <bf248f51-afd3-48de-939f-89df65b23595@suse.com>
Date: Thu, 23 Jul 2026 12:00:21 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/11] x86/virt/tdx: Optimize tdx_pamt_get/put()
To: Rick Edgecombe <rick.p.edgecombe@intel.com>, bp@alien8.de,
 dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, pbonzini@redhat.com,
 seanjc@google.com, tglx@kernel.org, vannapurve@google.com, x86@kernel.org,
 chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com,
 tony.lindgren@linux.intel.com, binbin.wu@intel.com
References: <20260718014500.2231262-1-rick.p.edgecombe@intel.com>
 <20260718014500.2231262-12-rick.p.edgecombe@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260718014500.2231262-12-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/18/26 04:45, Rick Edgecombe wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> The Dynamic PAMT get/put helpers use a global spinlock to serialize all
> refcount updates and SEAMCALL invocations. This gives correct behavior for
> concurrent callers, but leads to contention. It is especially bad from the
> KVM side, which is designed to allow faulting in EPT under a shared lock.
> With the global spinlock, not only is the lock an exclusive one, but it is
> for all TDs instead of just a single one.
> 
> But taking the global lock each time is actually unnecessary. Only the 0->1
> and 1->0 refcount transitions actually need the lock (to pair with
> SEAMCALLs that actually add and remove with the Dynamic PAMT pages). The
> common case of incrementing or decrementing a non-zero refcount can be
> done locklessly.
> 
> So create a fast and slow path. Check the refcount outside the lock and
> only take it for the slow path (0->1 and 1->0 transitions).
> 
> On the put side make the refcount adjustment and lock taking atomic so if
> a 'get' happens between them, it doesn't cause the Dynamic PAMT to be
> freed incorrectly. On the get side there is no technique for doing the
> refcount adjustment and lock atomically, so check the refcount again
> inside the lock.
> 
> AI was used under supervision to collect/apply feedback, review code and
> workshop logs. It assisted in identifying/evaluating the stale
> conditionals for the races resolved from the atomic_dec_and_lock() change.
> Separate from atomic_dec_and_lock() fallout, it suggested to change
> atomic_inc() to atomic_set(pamt_refcount, 1) in the put error path for the
> sake of being more precise, which Kiryl had also suggested in the past.
> The model also suggested updated comments following the
> atomic_dec_and_lock() change based on some directed prompting. The
> comments were subsequently edited or further prompted for fine tuning.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
