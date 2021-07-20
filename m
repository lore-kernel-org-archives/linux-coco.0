Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3651173
	for <linux-coco@lists.linux.dev>; Tue, 20 Jul 2021 09:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626773648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XV8I+8PwrPZnsF+J0mVxJplAW6dmriYfcaV2/c4g/9o=;
	b=WthOuSGhVf4S3MefE1++wgzlL8Nr4vgl31+lDZIlt2DdHdhLU63Svh+o50B8md/yyvLlCN
	aFGtXGsk94p/RswRJgfqipsF+dqZJ3+TBvvPCo4xOZTFXfka1P2Lf/FNGKHwwj0GvHYTzH
	lRFfdDX6AiyK7KL4oNuyDZgXnMZOZno=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-VsF9uey6NeSuV3WE8k9GgA-1; Tue, 20 Jul 2021 05:34:05 -0400
X-MC-Unique: VsF9uey6NeSuV3WE8k9GgA-1
Received: by mail-wr1-f70.google.com with SMTP id h11-20020adffa8b0000b029013a357d7bdcso10084071wrr.18
        for <linux-coco@lists.linux.dev>; Tue, 20 Jul 2021 02:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XV8I+8PwrPZnsF+J0mVxJplAW6dmriYfcaV2/c4g/9o=;
        b=FXG57LO1VIdQ/uZFVmq4ikTbipVBE+Anc6mchhgKcaC8KkM/4pCFT0HEIijQ+xUsj7
         qanfs4rEt83iQwxgE3Y7kW7KTN8xgw3GbO9p4iRjqmQBq35YYKrjX+lIufUt/BAcDE2Z
         8Unaizd6WYMNeTf8TVCQNKNi2gVMEZiV/VfQiWTCb1Ki1ZSlni21+pWsAiKaaXbCZLVo
         Y9wRvisxQFC2ihbZrvdUqBGCo/nZtIU7TZkfJ8lpPv0R9kuofilLEPDJgLNgEFYn330d
         uKy2ptUoQIFF7+Z9u/jNrGrZvfy76arHKE+RM4wyUb1HFbY/kg3BYBfrMQUYFggfq7dW
         iX/Q==
X-Gm-Message-State: AOAM533Z3Ii83/d80CvtiDNz4Bm6/V0ozrNi06Qs7/DfTZI4WukFFWJG
	w9gQEjGyNiV4t+s+qShKq8jNzFLTRtnfj/vL3J2GmB49Xj01n3rSqGSLUgnMVoZZtHoQ+ibsY88
	b/HciXESZjBHQfugcwmSv+A==
X-Received: by 2002:a5d:6a4d:: with SMTP id t13mr34507217wrw.412.1626773644015;
        Tue, 20 Jul 2021 02:34:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzHZhKwHX+Y1GZJBHsqWHJ/kZvRIkpWuNhFWkVYJa0xNJrWABu4uaUEH0JtFI36tYQoLgyHQ==
X-Received: by 2002:a5d:6a4d:: with SMTP id t13mr34507193wrw.412.1626773643871;
        Tue, 20 Jul 2021 02:34:03 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net. [82.29.237.198])
        by smtp.gmail.com with ESMTPSA id 129sm19560994wmz.26.2021.07.20.02.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 02:34:03 -0700 (PDT)
Date: Tue, 20 Jul 2021 10:34:01 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Joerg Roedel <jroedel@suse.de>
Cc: Andi Kleen <ak@linux.intel.com>, David Rientjes <rientjes@google.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Jon Grimm <jon.grimm@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	"Kaplan, David" <David.Kaplan@amd.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
Message-ID: <YPaYiW/TlrDydY6m@work-vm>
References: <YPV27hDPZUoVsIZt@suse.de>
 <4e33d22e-330f-c5ba-bc15-08a3298598c5@linux.intel.com>
 <YPaPk19JwcwmwzqR@suse.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YPaPk19JwcwmwzqR@suse.de>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
  Does the bitmap need to be page granulairty or can we work
on bigger chunks?

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

