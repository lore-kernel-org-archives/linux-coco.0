Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892F7238C21
	for <linux-coco@lists.linux.dev>; Wed, 16 Apr 2025 11:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744804711; cv=none; b=jkQAuXp2J/cLaufgDzynUBb7r0VGy9vmsT2vU4JAdWSYn2B0lsTyd657j57E/HkREd3ThKYgRgOIFeN1wAnAp00eICz2szcYpfwCg0YdZ5iIEArXnL27E5FqsdomhtfRg4VS3Dwc15LRj5L1uWY4oqdKkJ13Kpng01kaqfqTFm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744804711; c=relaxed/simple;
	bh=BH87NPQLzR0N2uAe5RTo9VAQCm7an0kuORRyAO5WWwE=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=cU6BEt7sqHy8pjeZ4hF0c3UUFbPhdIfaeXbQcIDmR4eY7trthN+lLQC4fj65DN88tGVG18glfLsJJmI9kTjRCZZIIMmpoKueoyeu2pTQ7Itfnomz1uuV9WAqun5rJJQGAv0vSbccswsHjKa1OTdTkUnuFpybFxPV790KhqArWqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jVcviz4i; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jVcviz4i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744804708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=Mp4NY5gTa5O8rModMIUVQJDbbAvIOmyixeqrBhfXZgQ=;
	b=jVcviz4ivkmufDH5INTuP7LuQudO+rgQZ8si4B9wyOJrhimaN0IRXX20o9ksZRRu4c2Pqa
	4IXOTctC8Q3SgBNo5CYUTf+Om+FZQRXgVn7l5YLhYKul3XHfLUnztVpISNlWKRBFoWr66M
	Mxipo0TGmjsZ5VSg1+gUmOMUJykZWeo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-mmYH115iOA-dMsQIoTmSaA-1; Wed, 16 Apr 2025 07:58:25 -0400
X-MC-Unique: mmYH115iOA-dMsQIoTmSaA-1
X-Mimecast-MFC-AGG-ID: mmYH115iOA-dMsQIoTmSaA_1744804704
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so50837485e9.2
        for <linux-coco@lists.linux.dev>; Wed, 16 Apr 2025 04:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744804704; x=1745409504;
        h=content-transfer-encoding:organization:autocrypt:subject:to
         :content-language:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mp4NY5gTa5O8rModMIUVQJDbbAvIOmyixeqrBhfXZgQ=;
        b=mQlDgn6YWNuTPxhHjLuKa9HZ4bYnU4OITBMWfFQN3/LSsEM53TpzgjlN2EsPSYYu2H
         bGRxjAp23lWv2w7GxFfP/sxCQFEWuMklZd3Pyr00sQvq/EmgX11Y07RKyqm3S1X8pQKv
         1LKCbTTZm2XkUibHdQidhrQ08+60JcanYQoIVfmzezVg6FpYri3unO2/5vv08Iz8ry7Y
         022IXfX5xIaNqRkVDA38kXhatonCIIsyGOhzk5u8OEL5TaAPg1337aJexpPuuW+B46B/
         t+a0QsXpML7UEf4GwbztX+3m8er2s8S3E12xmWnGTGtezqQtO/4u8+Yo9yLeHqI0f3WZ
         4jGw==
X-Gm-Message-State: AOJu0YymetcSVWWpDXRxbhnCw510DFSM1jOpTda8p9Tc/bmpbzQR98uv
	APbw6p0KGAsLvyQntMWoHhNZeEx/hWPFoq9arI0rOIucuEcA0uc4UDxil07hujWoQ0nPDB899Z2
	5SfDMDSrWp75ERkYoxJlrtAgwlMSkfVgcO/lAWqNKuwq15Eb2QN5cswXXEJ6Q86ZvRew5WKa7GJ
	VhR2Oasv7XJgsa5WzlwOGAAEe/4InfwFDAFTXPazzh6WOzLD4=
X-Gm-Gg: ASbGncvo94+p6TrJKXdJo+30xuJscdepsogjfPv4SOCJUjQfORv8L14yld1ezxizhCI
	tl2axdCwPFqSUugRxlynvEUAE/zSfA0swx+PNLoTw1/LHca9CgZMDMLO3Eam1LbDj+dTMSYY3JQ
	mJbXPNgZt3QTb3l2tKs5Xr+Tm9S1LDL5X/Wb8T6V/o1G91K8kv+eI6HzWlGriE1cxm/zlKmoTNz
	wAzl7V6VoSb3jrGW0C6mnwqAoknM2NoNrmROTrgxVBUFXTKCEqTSbLvMf7ThVfvi3KaG8mNudds
	sTkjOkUeRxlEt5zzWO/JU30iUOzQlTlfgzfGQ8FI2sA4F2GPYmodToUdmTSv9tJFS1GJpqZ+1GF
	AG3UdADETMbcvPHI+F2HDUzgfJl4GaqV0ItXe8A==
X-Received: by 2002:a05:600c:198b:b0:43d:45a:8fbb with SMTP id 5b1f17b1804b1-4405d6ad1acmr11674205e9.22.1744804703915;
        Wed, 16 Apr 2025 04:58:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF42Ew67th6BgNrQ3pNAl8Tem0TA/2gNSdCc2h3rozeMrLIbvkPdcxVAaqMMafRphJ7MSrRjg==
X-Received: by 2002:a05:600c:198b:b0:43d:45a:8fbb with SMTP id 5b1f17b1804b1-4405d6ad1acmr11673695e9.22.1744804703304;
        Wed, 16 Apr 2025 04:58:23 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4d11ddsm19208935e9.9.2025.04.16.04.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 04:58:22 -0700 (PDT)
Message-ID: <971a3797-5fc4-4c7f-a856-dca05f9a874e@redhat.com>
Date: Wed, 16 Apr 2025 13:58:20 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: David Hildenbrand <david@redhat.com>
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, KVM <kvm@vger.kernel.org>
Subject: [Invitation] bi-weekly guest_memfd upstream call on 2025-04-17
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zVhqZsZb4baGwTGSgG96U6kiukOugdwXRUTXhLimXcE_1744804704
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi everybody,

our next guest_memfd upstream call is scheduled for Thursday,
2025-04-17 at 8:00 - 9:00am (GMT-07:00) Pacific Time - Vancouver.

We'll be using the following Google meet:
http://meet.google.com/wxp-wtju-jzw

The meeting notes can be found at [1], where we also link recordings and
collect current guest_memfd upstream proposals. If you want an google
calendar invitation that also covers all future meetings, just write me
a mail.


If nothing else comes up, let's talk about the next steps to get basic 
mmap support [2] ready for upstream, to prepare for actual in-place 
conversion, direct-map removal and much more.

In particular, let's talk about what "basic mmap support" is, and what 
we can use it for without actual in-place conversion: IIUC "only shared 
memory in guest_memfd" use cases and some cases of software-protected 
VMs can use it.

Also, let's talk about the relationship/expectations between guest_memfd 
and the user (mmap) address when it comes to KVM memory slots that have 
a guest_memfd that supports "shared" memory.


To put something to discuss onto the agenda, reply to this mail or add
them to the "Topics/questions for next meeting(s)" section in the
meeting notes as a comment.

[1]
https://docs.google.com/document/d/1M6766BzdY1Lhk7LiR5IqVR8B8mG3cr-cxTxOrAosPOk/edit?usp=sharing
[2] 
https://lore.kernel.org/all/20250318161823.4005529-1-tabba@google.com/T/#u

-- 
Cheers,

David / dhildenb

