Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6989C265632
	for <linux-coco@lists.linux.dev>; Fri, 18 Jul 2025 07:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752824468; cv=none; b=bG767hjjSyCiVkZu+Fs9OrROiujNki4puCq20DUD/5syaXyED0uo0a088M523JXToBdEM1L2i3ot2eYIMNORNK4+/OAKOJ5+2IlxAlJZU7ggkZWsVcXn1irIM833sKSvad0IIY9xFkc9MOGqSqzNJKdxrq5n4U39Ny9qyzR+gO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752824468; c=relaxed/simple;
	bh=eH8YRhRJpc6NehW+7nuZDcphdqJ/DUxtYgNbRC6kVF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LtQwcqaLVnMw6hMd28DV1Mxx4UHY95YUVOko1FZYxg9loBKz/1Huw9U/TkaYrwwXYbM25DvK0+F6g6tD+r/PMr/MAmOn91WmWZtD1NFQJAe7gNVVVRSUMBCMeWVKhABzsSRjVqRQYxpb087W5HSnV+a1HL9hN5yzff7gk5lbOe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MQ86e6hp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MQ86e6hp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752824465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IG2eizzZJt3NfPiAIbYJBKp6D6nK5xGpStHjSOOxYBM=;
	b=MQ86e6hpkKbvhkzOkkpiG5iC8wc9d7zGHS3KyCx35rNxch8dv/9l/rfvwWMyuToB40+xLF
	S+ONctBUcXQPJpeY2sZekzW35q5PoOPE2t/rV1dozkGD6OVwEZjeQhTi11KDphpENs8JkD
	hubZdH0tOWkHujkJfr893vslWQl5pTI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-KL3Xw_ipO_Ol8UEEGafp6Q-1; Fri, 18 Jul 2025 03:41:04 -0400
X-MC-Unique: KL3Xw_ipO_Ol8UEEGafp6Q-1
X-Mimecast-MFC-AGG-ID: KL3Xw_ipO_Ol8UEEGafp6Q_1752824463
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f6ba526eso1056985f8f.1
        for <linux-coco@lists.linux.dev>; Fri, 18 Jul 2025 00:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752824463; x=1753429263;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IG2eizzZJt3NfPiAIbYJBKp6D6nK5xGpStHjSOOxYBM=;
        b=D22a6GmeBZewXP90caMEzCFIdCdDO18/yW1/ii5jC9hmGyio4t74byVUyCo9FpJ2XM
         t7+Hgd+HlmdJIlS2KajmgIZ2r76MSUOVyl+Qe4Hr+QMASJvNsmbdn/5chEtQkVZLzLXN
         NS8z874CVc930Yj/liy7NCYny4+HUh6CCNKUf/o5sdk+t8CklxkHqGXzq1qZWPZGVFzy
         fYs5+NHGh3kHPlWOqPbOvXdlZXG3XS1LBq29oR4XEP1fbO1eyEXgkUGEgmo7u7DPBOHc
         HEU97381To7oZDvKkuVJ0rcQwSzrvrdmH1Z+DHV/TBsJdfj1NbCuu5xjDkl/m6OLj1tM
         ALkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0O8HKzksAsLlmPfzir8qMJ9kSXKGtBt9u64pyS4DNhtfhR6vsRNmzF3vP+NjFQbj31KbbRAKmST0i@lists.linux.dev
X-Gm-Message-State: AOJu0YyguZK7SOSTvv3uCknS9vV1QqA+1eHg+M5z8cvLde9wUUoYLoYf
	cdIi2OVVJS2gGiDDCKfBu8oMOipvR6N03Kr97cnWyPhSJDrNk7A5DZSf3+KaeiPWB5Ug+uvBVn5
	05FSvvJ1s3ButXho0WFnXLyRcqdtYBNCTMV+S1cTPMf+u+/RWwFdGNAZ5OBLDEWM=
X-Gm-Gg: ASbGncuMIQgWoyUuEox8nkYkKMLHAC2soER+bwcweShYP4UOU09cNiZ+OU5M1hx/YMt
	eibayl6ET64VZ9C/kNvXtjJK86jXvi5i3BDXAk6g6fXJs/UspsdzslUYpmms6sVfFFvfMacxSAj
	dfYDey3sIm8OTKOvgpRX/QN3QfWp83/un8KC9n2kqECFGZngjxyXK3/toRPuVh8c/0Ld4atHfB0
	mZo5dsRkNxyoqoJ9E2hciNX7V8QvRV5YfaoJmVbPTgyU3HZhKZEfLqKKYHh5AQ1nBDoIYnf7Jov
	sRdnvCL3BaWPL2fhkTGyT9tT0xOXFU+Xk7649czBAgmwWeRYW5iv5WjIPCqdIDyI8RRf8QFfxVm
	IWGna6VU7AK4GWe6CGEY+P8rLyCr/BVsww1srVE8zmmEpYTMhXDS+lN2LM+QQMA6vbSQ=
X-Received: by 2002:a5d:5d0f:0:b0:3a5:2875:f985 with SMTP id ffacd0b85a97d-3b60e541decmr7571393f8f.59.1752824462697;
        Fri, 18 Jul 2025 00:41:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErnekwyCHSXJWmPTzAxRnoZcm5grCqfVzyJIN67YcS+CmXYHy9pgpO6xdAp8bqcnJ8yAM8qQ==
X-Received: by 2002:a5d:5d0f:0:b0:3a5:2875:f985 with SMTP id ffacd0b85a97d-3b60e541decmr7571360f8f.59.1752824462252;
        Fri, 18 Jul 2025 00:41:02 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f43:8900:f364:1333:2a67:d49e? (p200300d82f438900f36413332a67d49e.dip0.t-ipconnect.de. [2003:d8:2f43:8900:f364:1333:2a67:d49e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca2bc6fsm1075691f8f.28.2025.07.18.00.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 00:41:01 -0700 (PDT)
Message-ID: <eb6afc50-10e1-4326-95a6-6415f407c887@redhat.com>
Date: Fri, 18 Jul 2025 09:41:01 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Invitation] bi-weekly guest_memfd upstream call on 2025-07-17
To: Ira Weiny <ira.weiny@intel.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, KVM <kvm@vger.kernel.org>
References: <044a8f63-32d9-4c6f-ae3f-79072062d076@redhat.com>
 <687975b253bbf_3c282b2941@iweiny-mobl.notmuch>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <687975b253bbf_3c282b2941@iweiny-mobl.notmuch>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0EuL4LQEiqHUoANEtuJd_gE6Vq-Z-uP0E_AjIamoLVM_1752824463
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.07.25 00:14, Ira Weiny wrote:
> David Hildenbrand wrote:
>> Hi everybody,
>>
>> I had to move the meeting by one week -- I'll be out the next two days
>> -- and decided to send the invite out already to highlight that :)
>>
>> So, our next guest_memfd upstream call is scheduled for next week,
>> Thursday, 2025-07-17 at 8:00 - 9:00am (GMT-07:00) Pacific Time - Vancouver.
> 
> Did I hear correctly?  I thought I heard you mentioned that we are meeting
> again in a week?  So was today, 7/17, a one off shift of the bi-weekly call?
> 
> Or do we now meet 2 weeks from today?

So, the plan was to only move a single meeting (last week to this week) 
and to continue next week with the ordinary schedule.

So I am planning on sending out an invite next week for the meeting next 
week (July 24).

-- 
Cheers,

David / dhildenb

