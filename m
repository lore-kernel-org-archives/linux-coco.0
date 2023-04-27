Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40D5846C
	for <linux-coco@lists.linux.dev>; Thu, 27 Apr 2023 16:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=oCSISiBhQ6jeXLv+1vbq+8sBDufgGTcMCBny1IuJcBA=; b=jPsj+NvQ6JhhLQOlQGZSpOSoFr
	KyvtLIUbux6Rwe0+w+gjmpnSfXrPp34k1WkvkKBE9b5M706N29HEe9G9ldQxTljzBljfUyzwT+rGO
	qfXD/yWxb8ZRl+Xi+gfMh/WEYtiTyW6s9TL3PMod9pj12JgOCnn5POjk3LG9SKsspbG6selS3z+lQ
	s//+wQsCVdBOQXP+ZozIMEseKUhCtJCt2FECNCitS+r/gMoG8dU/pFr3vFPxxwI/d01vyNEI3gOja
	GWQaiHW31r6ACZz9qrwUIHfb65TjChiIKvKz1ZOnYX0t5aOYZlsw3HRHBO3XAWYPpzV74sWZDnow1
	sPOaNYUw==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1ps4lQ-0071jA-18;
	Thu, 27 Apr 2023 16:46:36 +0000
Message-ID: <8ebcfabb-0be3-f45c-c4f8-99ebc34f658e@infradead.org>
Date: Thu, 27 Apr 2023 09:46:31 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] docs: security: Confidential computing intro and threat
 model
Content-Language: en-US
To: jejb@linux.ibm.com, "Reshetova, Elena" <elena.reshetova@intel.com>,
 "Christopherson, , Sean" <seanjc@google.com>
Cc: Carlos Bilbao <carlos.bilbao@amd.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ardb@kernel.org" <ardb@kernel.org>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "dovmurik@linux.ibm.com" <dovmurik@linux.ibm.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "Dhaval.Giani@amd.com" <Dhaval.Giani@amd.com>,
 "michael.day@amd.com" <michael.day@amd.com>,
 "pavankumar.paluri@amd.com" <pavankumar.paluri@amd.com>,
 "David.Kaplan@amd.com" <David.Kaplan@amd.com>,
 "Reshma.Lal@amd.com" <Reshma.Lal@amd.com>,
 "Jeremy.Powell@amd.com" <Jeremy.Powell@amd.com>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "dinechin@redhat.com" <dinechin@redhat.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "berrange@redhat.com" <berrange@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "tytso@mit.edu" <tytso@mit.edu>,
 "jikos@kernel.org" <jikos@kernel.org>, "joro@8bytes.org" <joro@8bytes.org>,
 "leon@kernel.org" <leon@kernel.org>,
 "richard.weinberger@gmail.com" <richard.weinberger@gmail.com>,
 "lukas@wunner.de" <lukas@wunner.de>,
 "cdupontd@redhat.com" <cdupontd@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "sameo@rivosinc.com" <sameo@rivosinc.com>, "bp@alien8.de" <bp@alien8.de>,
 "security@kernel.org" <security@kernel.org>,
 Andrew Bresticker <abrestic@rivosinc.com>,
 Rajnesh Kanwal <rkanwal@rivosinc.com>, Dylan Reid <dylan@rivosinc.com>,
 Ravi Sahita <ravi@rivosinc.com>
References: <20230327141816.2648615-1-carlos.bilbao@amd.com>
 <ZEfrjtgGgm1lpadq@google.com>
 <DM8PR11MB575046B6DAA17B41FFED8080E7659@DM8PR11MB5750.namprd11.prod.outlook.com>
 <7502e1af0615c08167076ff452fc69ebf316c730.camel@linux.ibm.com>
 <ZElOfzn37kmesy7e@google.com>
 <DM8PR11MB57509EBCB1E2146C1768A6EEE76A9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <efda0be02fb0b5bf23aec11b5398d20908a821ba.camel@linux.ibm.com>
 <DM8PR11MB57502E1C09CDE4842B7F9B30E76A9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <8f212b0dfa9eb00ccc7acc5bf1483c9615277590.camel@linux.ibm.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <8f212b0dfa9eb00ccc7acc5bf1483c9615277590.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/27/23 09:16, James Bottomley wrote:
> Public but not open source is still a problem.  The federal government
> has walked into several cloud accounts demanding a source code security
> review, which means the code was made public to them but not generally.

Apparently we have different definitions of "public".
I don't call that public.

> Without all customers or some third party being able to build the code
> and verify it (or ideally supply it ... think something like Red Hat
> built the OVMF code this cloud is using and you can prove it using
> their build signatures) how do you know the source you're given
> corresponds to the binary the signature verifies.


-- 
~Randy
