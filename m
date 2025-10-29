Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57067262E
	for <linux-coco@lists.linux.dev>; Wed, 29 Oct 2025 14:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761746738; cv=none; b=DArdANfR+8XTGvEPtslePhcFP0+BcRPrsEsA+3QKzY7Sw24t/PxgiOPt1UMqwsZgm8kQ7lFL3WdTlZo4zwLcHb+W3DuT21MkYlAdwqAH5PIcWXVp7euTH1EhH/MCzvnLjH+KysMJPfi9JpYvb1+Esr+LMrJbgB+47EMiwbcXfsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761746738; c=relaxed/simple;
	bh=yJFe02mQTayTg3e4UiCyzVPf1kc7DRlcXkw6+ZW1Co0=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=peH3/u9ZeFNbV3yvI+yBhXBULJG/TTSwh19+O90zuc9zu5Ni5X9ObPIg9KkEVOgSA0dxcr4eiDofcvyxfBmOlsNKF50U2AmLnCtcXjJnyDm4R8GFmfGnTOh4OLzRxuMswUYfkB+TDMZcch3KIccOzPGGfgGdfaDU3ujUFUxdJCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XERhqO5e; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XERhqO5e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761746735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=cnslAE1BZQVrAKABEOK7rtluaysr6PV5JU1KbGuTZi4=;
	b=XERhqO5e/iOHF8Wt0/G0fHwA3GnigDGfqAjM9eqYHwL6TH6AxgcBLGZFp+R/q3cXIfaRvq
	pFk/F55S1oa+3oOsr/zdMYpmIEWLp3r7Q3g+ASffJE7fVOsDYRVXXglESRGXW+OoGNMBn0
	A2b6RKNVLfaprpr87Tqf1DcklqZEw/A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-_eYKjUpRNSuTOu4c0O7RVA-1; Wed, 29 Oct 2025 10:05:34 -0400
X-MC-Unique: _eYKjUpRNSuTOu4c0O7RVA-1
X-Mimecast-MFC-AGG-ID: _eYKjUpRNSuTOu4c0O7RVA_1761746733
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-63c585eb47bso803682a12.1
        for <linux-coco@lists.linux.dev>; Wed, 29 Oct 2025 07:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746733; x=1762351533;
        h=content-transfer-encoding:autocrypt:subject:to:content-language
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cnslAE1BZQVrAKABEOK7rtluaysr6PV5JU1KbGuTZi4=;
        b=jQ6a6pmUz3Iq6HRXd4AXVBXpM+x1NVAWd3CQoXb49fRiG7n8Dt/Jb6byKw4Pn7cWz0
         j6QwixpIQWtVJNnXxniRASAqvW1fKon6q6YlTGD8xnyIfz6Vt3aW1ITHHFVUD0R+WAEh
         sePYHBkfNE3fcoy3oTgl0DIwgn3fVN6v/JWZuKP71nILKJ2i7Qmdob0UP2BCiUMmtlsX
         E7AJaL7m79xULCmUxowBm8BdMVJIybJGteEZFjODZN09ntThDO9yzKj6DNqrJc/u+NU3
         0E9F2CgzBinnZjtRKLtSgJg3RHj72pzat60+BIpAPOAa6RWrluSeYGT/ZkISzm9kTLw6
         rLOw==
X-Gm-Message-State: AOJu0YxKq0J6yNHUghTk6+gLvTY1tj25pkJZBbDTs6UPE0M3S9xrTMYh
	08DTdypklqlZ3YYl7midGB/HCZSlCgJCqVB5GyardnOfmDymZQ+Z6XLBBP+To7LOOp3wLZn+HPi
	sIZl/ux196y9LbCIEPJpRGiXPMMmsLTuhNHOF3OqltcFv+o7dPOA5l32/UcJRyy13FErogPJUJ/
	SuR+YIb3yKF0v1A7tJoIICwGV2g3VuG2QM3+zhcMUieUEmOA==
X-Gm-Gg: ASbGncsEoxJyE2rU8lqmTeTvj5vL/Yb6Pq1UzbfWw9CQz8SomVhQc0GQlltSsIhDeMj
	HBLszcQz2JOa9QZJ0QQnFNGgI4x+Qhtv2zCPx5XgaRLVKyB/UgHSv0gNek4nnBgrSpk2PZL4LWy
	NZ6A5+zZoZzsAqagU+5TBecVhtxvPpuOm0UGQMU/NlaAJ2KT9UgDPb5OziGKeR7wBvpuAZUuLau
	MqsAOBF1W5HJgiKZhxFTQMq5jwUqX1VnPU2aGQHiZ68cKACMXJcy7c0ac6hSIPwqPlbsqsNIVGU
	OxFCpo+3YsXyFrUaxqCx8WN83P1xyyveWFBe253l0Tb1wJZW3CM4A8B5f8YRrss2+BwdpWs+1b2
	pDPT3gUtFEN0FpAZyLf2G4Q==
X-Received: by 2002:a05:6402:4305:b0:639:db35:62df with SMTP id 4fb4d7f45d1cf-640430c4203mr2738896a12.3.1761746732832;
        Wed, 29 Oct 2025 07:05:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzL9nsIzjqYVEDAPqxer68RLicZll6N15l3UlZtS3k0Ux6XvHSf70IZUbFQ651og2L846wOQ==
X-Received: by 2002:a05:6000:613:b0:407:d776:4434 with SMTP id ffacd0b85a97d-429a83e5134mr6401396f8f.30.1761746241529;
        Wed, 29 Oct 2025 06:57:21 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e2358cdsm51810715e9.16.2025.10.29.06.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 06:57:20 -0700 (PDT)
Message-ID: <f289e9f9-7c6b-4451-b78e-f22473c1d006@redhat.com>
Date: Wed, 29 Oct 2025 14:57:19 +0100
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
Subject: [Invitation] bi-weekly guest_memfd upstream call on 2025-10-29
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7zko5bxP1FkWYqCfgwWwMzEVhosDozwoCCDmhVR0tDc_1761746733
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi everybody,

Our next guest_memfd upstream call is scheduled for tomorrow, Thursday,
2025-10-29 at 8:00 - 9:00am (GMT-07:00) Pacific Time - Vancouver.

We'll be using the following Google meet:
http://meet.google.com/wxp-wtju-jzw

The meeting notes can be found at [1], where we also link recordings and
collect current guest_memfd upstream proposals. If you want an google
calendar invitation that also covers all future meetings, just write me
a mail.

In this meeting, we'll definitely have Ackerley give us an overview of 
work-in-progress HugeTLB support and likely we will talk about the 
in-place conversion patches that are already on the list! Further, 
Michael wants to talk about using the SWIOTLB for all most/shared pages 
we touched upon in the last meeting.

To put something to discuss onto the agenda, reply to this mail or add
them to the "Topics/questions for next meeting(s)" section in the
meeting notes as a comment.

[1]
https://docs.google.com/document/d/1M6766BzdY1Lhk7LiR5IqVR8B8mG3cr-cxTxOrAosPOk/edit?usp=sharing

-- 
Cheers

David / dhildenb


