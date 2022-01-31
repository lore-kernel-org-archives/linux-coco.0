Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906403FE3
	for <linux-coco@lists.linux.dev>; Mon, 31 Jan 2022 23:44:02 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id u14so30159364lfo.11
        for <linux-coco@lists.linux.dev>; Mon, 31 Jan 2022 15:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+h8DeuUfkcjLos3BviUGDVOpxtzirtyuHipEzyipWwg=;
        b=LEHAp+tjvjupiksn3rRU+MTYTYJP1zmZug2s1ZZldzoTJGpYo9m+xIPjubK2rtcde8
         GPVx0URubvo/jJvle5RTJhnlLC6JqkPwVNpFtC6I83045f95Guvh3joXjYsjHykGAlhq
         92OP3IdGZsIVkSJitzv8T5+TJfntyXg5hJSlvUP6BKmhR65VEndbO031zvU3CMnXmYk9
         37chJ05w0IkvWVqNAA3kZqvLNIDXrV27x1B83Wu+CnJ9lk9O+BCi95z2rkMNtZXgJub7
         vR4PpZz9noMFzfCD8iynifIes6TpoGPVFMyIInGkSWaFrJWp7gVEPpedEqol12ZjoTY0
         Ef8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+h8DeuUfkcjLos3BviUGDVOpxtzirtyuHipEzyipWwg=;
        b=KEdfpIZHF5S2ZgCAQYAA41xp90tsA7pgNYMV4Rv6a0fgQpZFlb6jkoG/4wGMFva4ox
         RXptO4RFxRDZlQCj/xmF3ghJ/l8lSg/bZmzUkQNgk3p3FRV4gRtOVgIGwXGWKNbRTUW6
         iymBScYRuKyNVdNmgV24Roa21E1ZB6f9fpB66kZu9hTdTh4zHUEYvkO7Cnt81MKuvaMp
         HOJ8CH5JyJxvqNacwrClklbRk75z5Kqt+zDS9xZTEb7voEiDUDAKNNTf55aPfyHfkign
         Y9eKmTsLNKIjsx3MnTCwK6g25bjKxRqJRQkQg5yVM68ZVf8R6YZsI2ro+3wp63N01gnA
         eb4A==
X-Gm-Message-State: AOAM5302+WSLb5RQBWmyJsAeGC6IrBgICwMeodsXPnUuJnehxt0zgJTG
	s6dVPmYBnqPLidVIeKkfMX6/lQ==
X-Google-Smtp-Source: ABdhPJy9muQCEl5VEBzDXlXUJUJcCiNqcoX+SUeTK/d+sBX/xKeTfWiTXJNIQJsO4DDl7bWle3JZBg==
X-Received: by 2002:a05:6512:1116:: with SMTP id l22mr16771617lfg.219.1643672640599;
        Mon, 31 Jan 2022 15:44:00 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id m12sm3812652lfj.90.2022.01.31.15.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 15:43:59 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
	id 5452110458C; Tue,  1 Feb 2022 02:44:37 +0300 (+03)
Date: Tue, 1 Feb 2022 02:44:37 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
	Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv3 2/7] efi/x86: Get full memory map in allocate_e820()
Message-ID: <20220131234437.twazkxvsdukhq2xs@box.shutemov.name>
References: <20220128205906.27503-1-kirill.shutemov@linux.intel.com>
 <20220128205906.27503-3-kirill.shutemov@linux.intel.com>
 <101a4497-ae17-ab69-640d-667c79da639b@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <101a4497-ae17-ab69-640d-667c79da639b@intel.com>

On Mon, Jan 31, 2022 at 02:38:42PM -0800, Dave Hansen wrote:
> On 1/28/22 12:59, Kirill A. Shutemov wrote:
> > Modify allocate_e820() to get a full memory map.
> 
> Dumb question time: why doesn't the current code get a full memory map?
>  This looks simpler.  What's the downside?  Memory consumption?

Yeah, it requires memory allocation that has to be freed back.

Otherwise I don't see any downsides. There are several more EFI calls, but
it should not make a noticable difference on boot time.

-- 
 Kirill A. Shutemov
